const rowInput = $("#input_height");
const colInput = $("#input_width");

$("#sizePicker").submit(function(event) {
	resetGrid();
	makeGrid();
	event.preventDefault();
});

function colorPicker(){
	var selectedColor = $("#colorPicker").val();
	return selectedColor;
}

function resetGrid(){
	$( "tbody" ).remove();
}

function makeGrid() {
	let height = rowInput.val();
	let width = colInput.val();

	$("table").append("<tbody></tbody>");
	for (var x = 0; x < height; x++) {
		$("tbody").append("<tr></tr>");
	}
	for (var y = 0; y < width; y++) {
		$("tr").append("<td></td>");
	}
	clickCell();
}

function clickCell(){
	var mouseDown = false;
	var selectedColor;

	$("td").bind({
		mousedown: function(event) {
			if(event.button == 0) {
				mouseDown = true;
				selectedColor = colorPicker();
				var currentCellColor = $(this).css("background-color");
				$(this).css("background-color",selectedColor);
				var newCellColor = $(this).css("background-color");
			}
			if(event.button == 2) {
				if (currentCellColor === newCellColor ){
					$(this).removeAttr("style");
				}
			}
		},
		mouseup: function() {
			mouseDown = false;
		},
		mouseover: function() {
			if(mouseDown) {
				$(this).css("background-color",selectedColor);
			}
		},
		dragstart: function() {
			mouseDown = false;
			return false;
		},
		contextmenu: function() {
			return false;
		}
	});
	$(window).on("mouseup", function() {
		mouseDown = false;
	});
}
