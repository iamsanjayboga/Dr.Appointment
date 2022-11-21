<%@ Page Title="My Appointment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LookAppointment.aspx.cs" Inherits="DrAppointment.LookAppointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" type="text/css" href="Content/tbl/css/style.css">
    <link href="Content/assets/css/style.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top: 50px"></div>

    <div class="row" style="margin-top: 20px; margin-bottom: 20px">
        <div class="col-lg-3"><b>Patient Name</b></div>
        <div class="col-lg-1"><b>App No</b></div>
        <div class="col-lg-2"><b>Booked</b></div>
        <div class="col-lg-3"><b>Email</b></div>
        <div class="col-lg-2"><b>Doctor</b></div>
    </div>
    <div class="row" style="margin-top: 30px; margin-bottom: 10px">
        <% foreach (var my in filter)
            { %>
        <div class="card" style="width: 100%; height: 80px; margin-bottom: 10px">
            <div class="row" style="margin-top: 15px; margin-bottom: 10px">
                <div class="col-lg-3">
                    <div class="user-info">
                        <div class="user-info__img">
                            <img src="Content/tbl/img/user1.jpg" alt="User Img">
                        </div>
                        <div class="user-info__basic">
                            <h6 class="mb-0"><%=my.Name %></h6>
                            <p class="text-muted mb-0"><%=my.Gender %>, Years</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-1">
                    <span class="btn btn-success"><%=my.rating %></span>
                </div>
                <div class="col-lg-2">
                    <h6 class="mb-0"><%=my.BirthDate %></h6>
                    <small><%=my.Expertise %></small>
                </div>
                <div class="col-lg-3">
                    <h6 class="mb-0"><%=my.Email %></h6>
                    <a href="#!"><small>Email</small></a>
                </div>
                <div class="col-lg-2">
                    <h6 class="mb-0"><%=my.Phone %></h6>

                </div>
                <div class="col-lg-1">

                    <a href="LookAppointment.aspx?CancelAppointment=<%=my.rating %>">❌</a>
                    <%--<asp:Button ID="Button1" CssClass="btn btn-danger" runat="server" Text="🗑️" />--%>
                </div>
            </div>

        </div>
        <% } %>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
