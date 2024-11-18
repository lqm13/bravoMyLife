// tinymce.init({selector:'textarea'});
tinymce.init({
	selector: "textarea#content",
	theme: "modern",
	//width: 100%,
	height: 200,
	plugins: [
		/*
		"advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
		"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
		"save table contextmenu directionality emoticons template paste textcolor"
		*/
		"advlist autolink link lists charmap print preview hr anchor pagebreak",
		"searchreplace visualblocks visualchars code fullscreen insertdatetime nonbreaking",
		"save table contextmenu directionality template paste textcolor"
	],
	//content_css: "css/content.css",
	//toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons",
	toolbar: "insertfile | bold italic | forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link | print preview fullpage",
	style_formats: [
		{title: 'Bold text', inline: 'b'},
		{title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
		{title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
		{title: 'Example 1', inline: 'span', classes: 'example1'},
		{title: 'Example 2', inline: 'span', classes: 'example2'},
		{title: 'Table styles'},
		{title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
	]
 }); 