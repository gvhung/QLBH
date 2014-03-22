<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<SaleManager.Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Log On
</asp:Content>

<asp:Content ID="script" ContentPlaceHolderID="ScriptContent" runat="server">
   <script>

       $(function () {
           $(document).keypress(function (evt) {
               if (evt.keyCode == "13")
                   $("#form").submit();
           });
       });

       function LoginValidation() {
           var flag = true;
           if ($("#username").val().trim() == "") {
               $("#Eusername").text("User name is require.");
               flag = false;
           } else {
               $("#Eusername").text("");
           }

           if ($("#password").val().trim() == "") {
               $("#Epassword").text("Password is require.");
               flag = false;
           } else {
               $("#Epassword").text("");
           }
           return flag;
       }


   </script>
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Log On</h2>
    <form id="form" method="post">
        <span style="color: red; font-weight: bold"> <%= Model == null ? "" : Model.Errors %></span>
        <div>
            <fieldset>
                <legend>Account Information</legend>
                
                <div class="editor-label">
                    User name
                </div>
                <div class="editor-field">
                    <input id="username" name="username" type="text" value="manager"/>
                    <span id="Eusername" style="color: red"></span>
                </div>
                
                <div class="editor-label">
                    Password
                </div>
                <div class="editor-field">
                    <input id="password" name="password" type="password"value="pass"/>
                    <span id="Epassword" style="color: red"></span>
                </div>
                
           <%--     <div class="editor-label">
                    <input id="RememberMe" name="RememberMe" type="checkbox" value="false" onchange="javascript:this.value = this.checked" />
                    Remember me?
                </div>                --%>
                <p>
                    <input type="submit" value="Log On" onclick="return LoginValidation();" />
                </p>
            </fieldset>
        </div>
    </form>
</asp:Content>
