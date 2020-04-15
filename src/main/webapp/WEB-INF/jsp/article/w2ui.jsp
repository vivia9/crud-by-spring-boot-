<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    <title>W2UI Demo: grid-1</title>
     <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
     
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://rawgit.com/vitmalina/w2ui/master/dist/w2ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://rawgit.com/vitmalina/w2ui/master/dist/w2ui.min.css" />


</head>
<body>



    
<div id="grid" style="width: 100%; height: 400px; overflow: hidden;"></div>
<div id="toolbar" style="width: 100%; height: 400px; overflow: hidden;"></div>
<br>







  <div class="Contents">
    <form id="frm1" name="frm1" action="" method="post">
        <input type="hidden" name="_csrf" value="71da130b-c422-450f-84e6-f8a7640b0763" />
        <input type="hidden" name="srchChkStDt" value="" />
        <input type="hidden" name="srchChkEdDt" value="" />
        <input type="hidden" name="srchProcYn" value="" />
        <input type="hidden" name="checkedData" value="" />
        <input type="hidden" name="gridData" value="" />
        <input type="hidden" id="popType" name="popType" value="1" />
        <input type="hidden" id="firstChrId" name="firstChrId" value="" />
        <input type="hidden" id="recId" name="recId" value="" />
        <input type="hidden" id="chkMail" name="chkMail" value="" />
        <input type="hidden" name="srchColId" value="" />
        <input type="hidden" name="srchColNm" value="" />
    </form>

    <div id="layout2" style="display:none;">
        <div id="main_Contents">
            <div class="Ctitle">
                <img src="/images/egovframework/skin1/skin1/sidebar03_title.png" alt="SolidStep 취약점 점검 &gt; 조치계획 수립"/>
                <h3>SolidStep 취약점 점검 &gt; 조치계획 수립</h3>
            </div>
            <div id="toolbar" style="padding: 6px 3px; border-top:1px solid #d5d8d8;"></div>
            <div id="mainGrid" style="width: 100%; height:calc(100% - 74px);"></div>
        </div>
        <div id="right_Contents" class="w2uilayout">
            <div id="form">
                <div class="w2ui-page page-0">
                    <div class="w2ui-field w2ui-span3">
                        <label>진단항목</label>
                        <div>
                            <input name="userCode" type="text" >
                        </div>
                    </div>
                    <div class="w2ui-field w2ui-span3">
                        <label>항목분류</label>
                        <div>
                            <input name="userClass" type="text" >
                        </div>
                    </div>
                    <div class="w2ui-field w2ui-span3">
                        <label>항목명</label>
                        <div>
                            <input name="title" type="text" >
                        </div>
                    </div>
                    <div class="w2ui-field w2ui-span3">
                        <label>위험도</label>
                        <div>
                            <input name="userLevelCdNm" type="text">
                        </div>
                    </div>
                    <div class="w2ui-field w2ui-span3">
                        <label>진단기준</label>
                        <div>
                            <textarea name="standard" type="text" class="bigtextarea_214"></textarea>
                        </div>
                    </div>
                    <div class="w2ui-field w2ui-span3">
                        <label>진단상세</label>
                        <div>
                            <textarea name="statusTxt" type="text" class="bigtextarea_214"></textarea>
                        </div>
                    </div>
                    <div class="w2ui-field w2ui-span3">
                        <label>조치방법</label>
                        <div>
                            <textarea name="fix" type="text" class="bigtextarea_214"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container" style="display:none;">
<div id="divChangeDatePop" class="layer popDecision">
<script type="text/javascript">
$(function () {
	$('input[type=us-date]').w2field('date',  { format: 'yyyy-mm-dd' });
    
});


    
function fn_popChangeDateSave() {
    var actDateNm = $('input[type=us-date]').val();
    var chg;
    var grid = w2ui['mainGrid'].getSelection();
    //빈값일경우 저장을하지 않는다.
    if(actDateNm == "" || actDateNm == null){
        w2alert('빈값은 저장하실수 없습니다.','알림')
        return;
    }

    for(var rec, ii=-1; rec = grid[++ii];) {
        chg = w2ui['mainGrid'].get(rec);
        chg.w2ui = chg.w2ui || {};
        chg.w2ui.changes = chg.w2ui.changes || {};
        chg.w2ui.changes.actLmtDtDtl = actDateNm;
    }
    w2ui['mainGrid'].refresh();

    var saveCntnt = JSON.stringify(w2ui['mainGrid'].getChanges());

    sendAjax(jsContextPath + "/vulChk/urlUpdateActLimitDtProc.json",{request:saveCntnt,actLmtDtDtl:actDateNm},function(data){
        w2alert('조치예정일이 변경되었습니다.','알림').done(function () {
            w2ui['mainGrid'].save();
            w2popup.close();
            fn_loadGridData();
        });
    });
}
</script>
    <div class="cont-area pop_margin" >
        <div class="text-area" style="text-align:center; margin-bottom:10px;">조치예정일을 선택하고 아래 일괄지정 버튼을 누르세요.<br />*참고 : 목록의 체크된 것만 적용됩니다.</div>
        <div class="input-area04" style="text-align:center;">
            <input type="us-date" style="width:120px; text-align:center;">
        </div>
    </div>
</div>
</div>
  
  
  

	
<script >



var config = {
	    layout: {
	        name: 'layout',
	        padding: 0,
	        panels: [
	            { type: 'top', size: 32, content: '<div style="padding: 7px;">Top Panel</div>', style: 'border-bottom: 1px solid silver;' },
	            { type: 'left', size: 200, resizable: true, minSize: 120 },
	            { type: 'main', minSize: 350, overflow: 'hidden' }
	        ]
	    },

	    form: { 
	        header: 'Edit Record',
	        name: 'form',
	        fields: [
	            { name: 'recid', type: 'text', html: { caption: 'ID', attr: 'size="10" readonly' } },
	            { name: 'fname', type: 'text', required: true, html: { caption: 'First Name', attr: 'size="40" maxlength="40"' } },
	            { name: 'lname', type: 'text', required: true, html: { caption: 'Last Name', attr: 'size="40" maxlength="40"' } },
	            { name: 'email', type: 'email', html: { caption: 'Email', attr: 'size="30"' } },
	            { name: 'sdate', type: 'date', html: { caption: 'Date', attr: 'size="10"' } }
	        ],
	        actions: {
	            Reset: function () {
	                this.clear();
	            },
	            Save: function () {
	                var errors = this.validate();
	                if (errors.length > 0) return;
	                if (this.recid == 0) {
	                    w2ui.grid.add($.extend(true, { recid: w2ui.grid.records.length + 1 }, this.record));
	                    w2ui.grid.selectNone();
	                    this.clear();
	                } else {
	                    w2ui.grid.set(this.recid, this.record);
	                    w2ui.grid.selectNone();
	                    this.clear();
	                }
	            }
	        }
	    }

	
	};



$(function () {
    // initialization in memory
    $().w2layout(config.layout);
    
});




$(function () {
    $('#grid').w2grid({ 
        name: 'grid', 
        header: 'List of Names',
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
        onClick: function(event) {
            var grid = this;
            var form = w2ui.form;
            var record = this.get(event.recid);
            event.onComplete = function () {
                if (grid.columns[event.column]) {
                    if (grid.columns[event.column].field == 'chrNmArr') {
                        
                        var get_sel = w2ui['mainGrid'].getSelection();
                        if (get_sel.length != 1) {
                            w2ui['mainGrid'].select(event.recid);
                        }
                        $("#recId").val(event.recid);
                        var lstChrId = new Array();
                        var chrIdArr = record.chrIdArr;
                        if (chrIdArr != null && chrIdArr != "") {
                            var chrIdArrLst = chrIdArr.split(",");
                            for(var rec, ii=-1; rec = chrIdArrLst[++ii];) {
                                lstChrId[ii] = rec;
                            }
                        }
                        $('#firstChrId').val(JSON.stringify(lstChrId));
                        fn_popRprsn();
                    }
                }

                var sel = grid.getSelection();
                if (sel.length == 1) {
//                     if (mainGridChg != sel[0]) {
                        fn_formEditingOn('form');
                        fn_loadDtlData(form,sel[0],'1');
//                     } else {
//                     }
//                     mainGridChg = sel[0];
//                 } else if (sel.length > 1) {
//                     form.clear();
//                     fn_formEditingOff('form');
// //                     $("#chrIdSec").html("");
                } else {
                    form.clear();
                    fn_formEditingOff('form');
                }
            }
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



function openPopup() {
    w2popup.open({
        title   : 'Popup',
        width   : 800,
        height  : 600,
        showMax : true,
        body    : '<div id="main" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px;"></div>',
        onOpen  : function (event) {
            event.onComplete = function () {
                $('#w2ui-popup').w2render('form');
                /* w2ui.layout.content('left', w2ui.sidebar);
                w2ui.layout.content('main', w2ui.grid); */
            }
        },
        onToggle: function (event) { 
            event.onComplete = function () {
                w2ui.layout.resize();
            }
        }        
    });
}


/* 조치예정일 일괄지정 */
function fn_changeDatePop(){
	
    if (str_body4 == null || str_body4 == "") {
        str_body4 = $("#divChangeDatePop").html();
        $("#divChangeDatePop").remove();
    }

    var gridSel;
    var grid = w2ui['grid'].getSelection();
    var str = [], hh = -1;
    for(var rec, ii=-1; rec = grid[++ii];) {
        gridSel = w2ui['grid'].get(rec);
        if (ii > 0) {
            str[++hh] = ",";
        }
        str[++hh] = gridSel.recid;
        str[++hh] = ":";
        str[++hh] = gridSel.plmSeq;
        str[++hh] = ":";
    }

    $("input[name='checkedData']").val( str.join('') );

    w2popup.open({
        title: '조치예정일 일괄지정',
        body: str_body4,
        width           : 450,
        height          : 188,
        buttons   : '<button class="w2ui-btn" type="button" onclick="fn_popChangeDateSave();">일괄지정</button> ',
        onOpen  : function () {
        },
        onClose : function (event) {
        }
    });
}



var str_body2 = "";
var str_body4 = "";
var codeP0 = [{"id":"N","text":"미조치"},{"id":"Y","text":"완료"}];
var srchAprvLastSts="";
var srchActPlanRprtYn="";







/* datepicker input 변경 콜백 */
function fnChgCbregDate() {
    var chk = 0;
    var chgCntnt = w2ui['grid'].getChanges();
    for(var rec, ii=-1; rec = chgCntnt[++ii];) {
        if(rec.regDate =="" || rec.regDate == null){
            w2alert('빈값은 저장하실수 없습니다.','알림')
            w2ui['grid'].onReload();
            return;
        }
        if (rec.regDate != w2utils.formatDate(rec.regDate,'yyyy-mm-dd')) {
       	/* if (rec.regDate != w2utils.formatDate(rec.regDate,'yyyy-mm-dd')) { */
            chk = 1;
            break;
        }
    }
    if (chk == 1) {
        w2alert('날짜 형식이 잘못 되었습니다.','알림');
        return;
    }

    var saveCntnt = JSON.stringify(chgCntnt);

    sendAjax(jsContextPath + "/vulChk/urlUpdateActLimitDtProc.json",{request:saveCntnt},function(data){
        if (data.rtnCode == '1') {
            w2alert('조치예정일이 변경되었습니다.','알림');
            w2ui['grid'].save();
            fn_loadGridData();
        }
    });
}


$(function () {
    $('input[type=us-date]').w2field('date',  { format: 'yyyy-mm-dd' });
});





/* 그리드(mainGrid) 데이타 로드 */
function fn_loadGridData() {
    var srchChkNm = "";
    if ($('#chkName').w2field()) {
        var str = [], kk = -1;
        var objChkNm = $('#chkName').w2field().options.selected;
        for(var rec, ii=-1; rec = objChkNm[++ii];) {
            if (ii > 0) {
                str[++kk] = ",";
            }
            str[++kk] = rec.id;
        }
        srchChkNm = str.join('');
    }

    if ($("#srchStDt").val()) {
        $("input[name=srchChkStDt]").val($("#srchStDt").val());
    }
    if ($("#srchEdDt").val()) {
        $("input[name=srchChkEdDt]").val($("#srchEdDt").val());
    }

    if ($('input[type=list]').w2field()) {
        $("input[name=srchProcYn]").val($('input[type=list]').w2field().get().id);
    } else {
        $("input[name=srchProcYn]").val("");
    }

    sendAjax(jsContextPath+'/vulChk/actPlanListProc.json'
            ,{srchChkNm:srchChkNm
              , srchChkStDt:$("input[name=srchChkStDt]").val()
              , srchChkEdDt:$("input[name=srchChkEdDt]").val()
              , srchProcYn:$("input[name=srchProcYn]").val()
            },function(data){
            w2ui.mainGrid.records = data;
            w2ui.mainGrid.render();
            w2ui.mainGrid.refresh();
            fn_sttstInfo(srchChkNm, $("input[name=srchChkStDt]").val(), $("input[name=srchChkEdDt]").val(), $("input[name=srchProcYn]").val());
    });
}

</script>

</body>

</html>