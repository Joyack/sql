<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>图书馆</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<div  id="login">
    <div class="form-inline" >
            <div class="input-group">
                <span class="input-group-addon">账号</span>
                <input type="text" class="form-control"  id="id">
            </div><br/><br/>
        <div class="input-group">
            <span class="input-group-addon">密码</span>
            <input type="password" class="form-control"  id="passwd">
        </div><br/>
        <p style="text-align: right;color: red;position: absolute" id="info"></p><br/>
        <button id="loginButton"  class="btn btn-default">登陆
        </button>

    </div>
    <script>
        $("#id").keyup(
            function () {
                if(isNaN($("#id").val())){
                    $("#info").text("提示:账号只能为数字");
                }
                else {
                    $("#info").text("");
                }
            }
        )

        $("#loginButton").click(function () {
            if($("#id").val()==''&&$("#passwd").val()==''){
                $("#info").text("提示:账号和密码不能为空");
            }
            else if ($("#id").val()==''){
                $("#info").text("提示:账号不能为空");
            }
            else if($("#passwd").val()==''){
                $("#info").text("提示:密码不能为空");
            }
            else if(isNaN($("#id").val())){
                $("#info").text("提示:账号必须为数字");
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "/api/loginCheck",
                    data: {
                        id:$("#id").val() ,
                        passwd: $("#passwd").val()
                    },
                    dataType: "json",
                    success: function(data) {
                        if(data.stateCode.trim() == "0") {
                            $("#info").text("提示:账号或密码错误！");
                        } else if(data.stateCode.trim() == "1") {
                            $("#info").text("提示:登陆成功，跳转中...");
                            window.location.href="/admin_main.html";
                        } else if(data.stateCode.trim() == "2"){
                            $("#info").text("提示:登陆成功，跳转中...");
                            window.location.href="/reader_main.html";
                        }
                    }
                });
            }
        })
    </script>
</div>

</body>
</html>
