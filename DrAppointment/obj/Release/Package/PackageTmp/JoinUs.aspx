<%@ Page Title="Join Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JoinUs.aspx.cs" Inherits="DrAppointment.JoinUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <!-- Icons font CSS-->
    <link href="Content/Reg/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="Content/Reg/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="Content/Reg/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="Content/Reg/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="Content/Reg/css/main.css" rel="stylesheet" media="all">
    <!-- Jquery JS-->
    <script src="Content/Reg/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="Content/Reg/vendor/select2/select2.min.js"></script>
    <script src="Content/Reg/vendor/datepicker/moment.min.js"></script>
    <script src="Content/Reg/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="Content/Reg/js/global.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins">
        <div class="wrapper wrapper--w780">
            <div class="card card-3">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">Registration Info</h2>
                    <%--<form method="POST">--%>
                    <div class="input-group">
                        <asp:TextBox ID="name" class="input--style-3" ClientIDMode="Static" AutoCompleteType="None" placeholder="Name" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <%--<input class="input--style-3 js-datepicker" id="dob" type="text" runat="server" placeholder="Birthdate" name="birthday">--%>
                        <asp:TextBox ID="dob" class="input--style-3 js-datepicker" ClientIDMode="Static" placeholder="Birthdate" name="birthday" runat="server"></asp:TextBox>
                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                    </div>
                    
                    <div class="input-group" runat="server">
                        <div class="rs-select2 js-select-simple select--no-search">
                            <asp:DropDownList ID="Gender" runat="server">
                                <asp:ListItem Text="Gender" Value="Select"></asp:ListItem>
                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                            </asp:DropDownList>
                            <div class="select-dropdown"></div>
                        </div>
                    </div>
                    <div class="input-group">
                        <asp:TextBox ID="email" class="input--style-3" ClientIDMode="Static" placeholder="email" runat="server"></asp:TextBox>
                        <%--<input class="input--style-3" type="email" placeholder="Email" name="email">--%>
                    </div>
                    <div class="input-group">
                        <asp:TextBox ID="phone" class="input--style-3" ClientIDMode="Static" placeholder="Phone" runat="server"></asp:TextBox>
                        <%--<input class="input--style-3" type="text" placeholder="Phone" name="phone">--%>
                    </div>
                    <div class="input-group" runat="server">
                        <div class="rs-select2 js-select-simple select--no-search">
                            <asp:DropDownList ID="JoinAs" runat="server" AutoPostBack = "true" OnSelectedIndexChanged="SelectExpertise">
                                <asp:ListItem Text="Join As" Value="Select"></asp:ListItem>
                                <asp:ListItem Text="Doctor" Value="Doctor"></asp:ListItem>
                                <asp:ListItem Text="Patient" Value="Patient"></asp:ListItem>
                            </asp:DropDownList>
                            <div class="select-dropdown"></div>
                        </div>
                    </div>
                    <div class="input-group" runat="server" id="expertdiv">
                        <div class="rs-select2 js-select-simple select--no-search">
                            <asp:DropDownList ID="expertise" runat="server" Visible="false">
                                <asp:ListItem Text="Primary Care" Value="Primary Care"></asp:ListItem>
                                <asp:ListItem Text="Dentist" Value="Dentist"></asp:ListItem>
                                <asp:ListItem Text="Eye Care" Value="Eye Care"></asp:ListItem>
                                <asp:ListItem Text="Dermatologists" Value="Dermatologists"></asp:ListItem>
                            </asp:DropDownList>
                            <div class="select-dropdown"></div>
                        </div>
                    </div>

                    <div class="p-t-10">
                        <%--<button class="btn btn--pill btn--blue" type="submit">Submit</button>--%>
                        <asp:Button ID="Button1" CssClass="btn-reg btn--pill btn--blue" runat="server" ClientIDMode="Static" Text="Submit" OnClick="Registeration"/>
                        <a class="btn btn--pill btn--red" href="Login.aspx">Login</a>
                    </div>
                    
                    <%--</form>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script>
        (function ($) {
            'use strict';
            /*==================================================================
                [ Daterangepicker ]*/
            try {
                $('.js-datepicker').daterangepicker({
                    "singleDatePicker": true,
                    "showDropdowns": true,
                    "autoUpdateInput": false,
                    locale: {
                        format: 'YYYY-MM-DD'
                    },
                });

                var myCalendar = $('.js-datepicker');
                var isClick = 0;

                $(window).on('click', function () {
                    isClick = 0;
                });

                $(myCalendar).on('apply.daterangepicker', function (ev, picker) {
                    isClick = 0;
                    $(this).val(picker.startDate.format('YYYY-MM-DD'));

                });

                $('.js-btn-calendar').on('click', function (e) {
                    e.stopPropagation();

                    if (isClick === 1) isClick = 0;
                    else if (isClick === 0) isClick = 1;

                    if (isClick === 1) {
                        myCalendar.focus();
                    }
                });

                $(myCalendar).on('click', function (e) {
                    e.stopPropagation();
                    isClick = 1;
                });

                $('.daterangepicker').on('click', function (e) {
                    e.stopPropagation();
                });


            } catch (er) { console.log(er); }
            /*[ Select 2 Config ]
                ===========================================================*/

            try {
                var selectSimple = $('.js-select-simple');

                selectSimple.each(function () {
                    var that = $(this);
                    var selectBox = that.find('select');
                    var selectDropdown = that.find('.select-dropdown');
                    selectBox.select2({
                        dropdownParent: selectDropdown
                    });
                });

            } catch (err) {
                console.log(err);
            }


        })(jQuery);
    </script>
</asp:Content>
