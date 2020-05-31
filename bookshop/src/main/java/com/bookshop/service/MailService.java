package com.bookshop.service;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.bookshop.bean.MailInfo;



@Service
public class MailService {
	@Autowired
	JavaMailSender mailer;

	public void send(MailInfo mail) throws MessagingException {
		//Tạo message bằng MimeMessage
		MimeMessage message = mailer.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		helper.setText(mail.getBody(), true);
		helper.setReplyTo(mail.getFrom());

		if (mail.getCc() != null) {
			helper.setCc(mail.getCc());
		}

		if (mail.getBcc() != null) {
			helper.setBcc(mail.getBcc());
		}

		if (mail.getFiles() != null) {
			//mail.getFiles() lấy đường dẫn rồi tách ra nếu nhiều file (cách nhau bởi dấu ;)
			String[] paths = mail.getFiles().split(";");
			for (String path : paths) {
				File file = new File(path);
				helper.addAttachment(file.getName(), file);
			}
		}

		mailer.send(message);
	}
}
