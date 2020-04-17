<!DOCTYPE html>
<html>
<head>
    <title>W2UI Demo: layout-3</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://rawgit.com/vitmalina/w2ui/master/dist/w2ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://rawgit.com/vitmalina/w2ui/master/dist/w2ui.min.css" />
</head>
<body>

<div id="layout" style="width: 100%; height: 400px;">

<div id="main">
<div id="grid" style="width: 100%; height: 400px; overflow: hidden;"></div>
<div id="toolbar" style="width: 100%; height: 400px; overflow: hidden;"></div>
</div>


</div>

<br>
<input type="checkbox" id="instant" onclick="window.instant = this.checked;"> <label for="instant">Instant</label>
<div style="height: 10px;"></div>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('top', window.instant)">Top</button>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('left', window.instant)">Left</button>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('right', window.instant)">Right</button>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('preview', window.instant)">Preview</button>
<button class="w2ui-btn" onclick="w2ui['layout'].toggle('bottom', window.instant)">Bottom</button>

<script type="text/javascript">


var main_Contents = $("#main").html(); 
 $("#main_Contents").html(""); 


$(function () {    
    var pstyle = 'border: 1px solid #dfdfdf; ';
    $('#layout').w2layout({
        name: 'layout',
        panels: [
            
            { type: 'main', resizable: true, content: main_Contents },
            
            { type: 'right', size: 200, resizable: true, hidden: true,  content: 'right' }
            
        ]
    });
    
});




	
</script>




	
<script >





$(function () {
    $('#grid').w2grid({ 
        name: 'grid', 
        header: 'My Grid',
        url: '/test3',       
        recid: 'id', 
        method: 'GET', // need this to avoid 412 error on Safari
        show: {
            toolbar : true,
            footer:true,
            lineNumbers : true,
            selectColumn : true,
            expandColumn : false,
            toolbarSearch : true,
            toolbarSave: true,
        	toolbarAdd : true,
			toolbarDelete : true,
			toolbarSave : true,
			toolbarEdit : true,
			header : true
        },
        recordHeight: 20,
        sortData: [ { field: 'id', direction: 'asc' } ],
                
        columns: [                
            { field: 'id', caption: 'ID', size: '30%' , editable: { type: 'text' }},
            { field: 'title', caption: 'Last Name', size: '30%' },
            { field: 'body', caption: 'Email', size: '40%' },
            { field: 'regDate', caption: 'regDate', size: '40%',  editable: { type: 'date' } }
            
        ],
        reorderColumns: true,
        reorderRows: true, //row이동
        
        multiSearch: true,
        searches: [
            { type: 'int',  field: 'id', caption: 'ID' },
            { type: 'text', field: 'title', caption: 'title' },
            { type: 'text', field: 'body', caption: 'body' },
            { type: 'text', field: 'regDate', caption: 'regDate' }
            
        ],
        toolbar: {
            items: [{type: 'spacer'},
                    { type: 'button', id: 'btn_report', caption:'button', text: '조치계획보고', icon: 'icon_content report', checked:false},
                    { type: 'break' },
                    { type: 'button', id: 'btn_request', caption:'button', text: '조치요청', icon: 'icon_content planRequest', checked:false},
                    { type: 'break' },
                    { type: 'button', id: 'btn_calendar', caption:'button', text: '조치예정일', checked:false, icon:'icon_content calendar'},
                    { type: 'button', id: 'btn_assetRprsn', caption:'button', text: '담당자', checked:false, icon:'icon_content manager'},
                    { type: 'break' },
                    { type: 'button', id: 'btn_exclDown', caption:'button', text: 'Excel', checked:false, icon:'icon_content exclDown'},
                    { type: 'break' },
                    { type:'button',id:'btn_right',caption:'button',text:'', icon:'fa-chevron-left'}, 
                    { id: 'add', type: 'button', caption: 'Add Record', icon: 'w2ui-icon-plus' }


                    ],
                    onClick: function (target, data) {
                        if (target == 'btn_report') {
                            var gridSel = w2ui['mainGrid'].getSelection();
                            if (gridSel == null || gridSel == "") {
                                w2alert('보고 처리 할 대상을 선택해 주세요.','알림');
                            } else {
                                openLayerPop05('1','mainGrid');
                            }
                        } else if (target == 'btn_request') {
                            var gridSel = w2ui['mainGrid'].getSelection();
                            if (gridSel == null || gridSel == "") {
                                w2alert('조치요청 메일발송 대상을 체크해 주세요.','알림');
                            } else {
                                fn_sendMail();
                            }
                        } else if (target == 'btn_calendar') {
                            var gridSel = w2ui['grid'].getSelection();
                            if (gridSel == null || gridSel == "") {
                                w2alert('조치예정일 일괄지정할 대상을 체크해 주세요.','알림');
                         }else if (target == 'add') {
                          w2ui.grid.add({ recid: w2ui.grid.records.length + 1 });

                         }
                            else {
                            	/* openPopup(); */


                            	
                                /* w2alert(gridSel); */
                                fn_changeDatePop(); 
                                
                            }
                        } else if (target == 'btn_assetRprsn') {
                            var gridSel = w2ui['mainGrid'].getSelection();
                            if (gridSel == null || gridSel == "") {
                                w2alert('담당자 일괄지정할 대상을 체크해 주세요.','알림');
                            } else {
                                $("#recId").val("");
                                $('#firstChrId').val("");
                                fn_popRprsn();
                            }
                        } else if (target == 'btn_exclDown') {
                            //fn_excelDown();
                            openLayerPop();
                        } else if (target == 'btn_right') {
                            rightMenuOpen();
                            $(".fa-chevron-left").toggleClass("on");
                        }
                    },
                    onChange: function (event) {
                        event.onComplete = function () {
                            fnChgCbregDate();
                        }
                    }
        },

        onReload: function(event) {
            fn_loadGridData();
        },
   
        onChange: function (event) {
            event.onComplete = function () {
                fnChgCbActLmtDtDtl();
            }
        },
        
        onExpand: function (event) {
            $('#'+event.box_id).html('<div style="padding: 10px; height: 100px">Expanded content</div>');
        }
    });    
});

</script>

</body>
</html>