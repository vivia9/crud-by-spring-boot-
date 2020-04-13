<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    <title>W2UI Demo: grid-1</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://rawgit.com/vitmalina/w2ui/master/dist/w2ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://rawgit.com/vitmalina/w2ui/master/dist/w2ui.min.css" />


</head>
<body>
<button class="w2ui-btn" onclick="var obj = w2ui['grid']; obj.show.header = !obj.show.header; w2ui['grid'].refresh();">Header</button>
<button class="w2ui-btn" onclick="var obj = w2ui['grid']; obj.show.toolbar = !obj.show.toolbar; w2ui['grid'].refresh();">Toolbar</button>
<button class="w2ui-btn" onclick="var obj = w2ui['grid']; obj.show.columnHeaders = !obj.show.columnHeaders; w2ui['grid'].refresh();">Column Headers</button>
<button class="w2ui-btn" onclick="var obj = w2ui['grid']; obj.show.footer = !obj.show.footer; w2ui['grid'].refresh();">Footer</button>
<button class="w2ui-btn" onclick="var obj = w2ui['grid']; obj.show.lineNumbers = !obj.show.lineNumbers; w2ui['grid'].refresh();">Line Numbers</button>
<button class="w2ui-btn" onclick="var obj = w2ui['grid']; obj.show.selectColumn = !obj.show.selectColumn; w2ui['grid'].refresh();">Select Column</button>
<button class="w2ui-btn" onclick="var obj = w2ui['grid']; obj.show.expandColumn = !obj.show.expandColumn; w2ui['grid'].refresh();">Expand Column</button>

<div id="grid" style="width: 100%; height: 400px; overflow: hidden;"></div>
<br>

	
<script >
$(function () {
    $('#grid').w2grid({ 
        name: 'grid', 
        header: 'List of Names',
        url: '/test3',
        method: 'GET', // need this to avoid 412 error on Safari
        show: {
            header         : true,
            toolbar     : true,
            footer        : true,
            lineNumbers    : true,
            selectColumn: true,
            expandColumn: true
        },
                
        columns: [                
            { field: 'id', caption: 'First Name', size: '30%' },
            { field: 'title', caption: 'Last Name', size: '30%' },
            { field: 'body', caption: 'Email', size: '40%' }
            
        ],
        multiSearch: true,
        searches: [
            { type: 'int',  field: 'id', caption: 'ID' },
            { type: 'text', field: 'title', caption: 'title' },
            { type: 'text', field: 'body', caption: 'body' }
            
        ],
        onExpand: function (event) {
            $('#'+event.box_id).html('<div style="padding: 10px; height: 100px">Expanded content</div>');
        }
    });    
});


</script>

Even though you created initial search, the user can clear or overwrite it. You can defined some search fields as hidden if you want 
to prevent user from messing up your search, or you can add search data into <a class="method" href="w2grid.postData">.postData</a> 
object which will get submitted to the server and will not allow user to clear it.
<div style="height: 10px"></div>

The structure of the search object is:
<textarea class="javascript">
search = {
    field    : '',    // search field name
    value    : '',    // string or array of string with values
    operator : 'is',  // search operator [is, in, between, begins with, contains, ends with]
    type     : ''     // data type, [text, int, float, date]
}
</textarea>

You can use <a href="w2grid.search" class="method">.search()</a> method to submit searches.

</body>

</html>