<%@ page pageEncoding="utf-8"%>

<div class="container" style="padding: 30px">
		<div class="row">
			<div class="col-md-12">
				<h2>FEEDBACK</h2>
				<form>
					<div class="form-group">
						<label for="survey">Do you feel satisfied with our web?</label>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="yes_Checkbox" value="option1"> <label
								class="form-check-label" for="yes_Checkbox">Yes</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="partially_Checkbox" value="option2"> <label
								class="form-check-label" for="partially_Checkbox">Partially</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox"
								id="no_Checkbox" value="option3"> <label
								class="form-check-label" for="no_Checkbox">No</label>
						</div>
				</div>
					<div class="form-group">
						<label for="comment">Would you like to give us some comments?</label> 
						<textarea class="form-control" rows="5" id="comment" placeholder="Comment here...."></textarea>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
		</div>
		</div>
	</div>
	<script>
	$(document).ready(function(){
	    $('input:checkbox').click(function() {
	        $('input:checkbox').not(this).prop('checked', false);
	    });
	});
	
	</script>