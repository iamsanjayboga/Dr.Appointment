<%@ Page Title="View All Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAllByList.aspx.cs" Inherits="DrAppointment.ViewAllByList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="margin-top:50px"></div>
    <h4>Patients List</h4>
    <asp:GridView ID="PatientGridView1" CssClass="table table-bordered table-condensed table-responsive table-hover"
        runat="server"></asp:GridView>
    <h4>Doctors List</h4>
    <asp:GridView ID="DoctorGridView2" CssClass="table table-bordered table-condensed table-responsive table-hover" 
        runat="server"></asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
