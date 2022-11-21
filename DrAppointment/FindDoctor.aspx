<%@ Page Title="Find your Doctor" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FindDoctor.aspx.cs" Inherits="DrAppointment.FindDoctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="assets/css/style.css" rel="stylesheet">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row" style="margin-top: 30px">
        <a class="btn btn-outline-dark btn-rounded btn-sm" style="width: 150px" href="FindDoctor.aspx?Expertise=Primary">🩺 Primary Care</a>
        &nbsp;
        <a class="btn btn-outline-dark btn-rounded btn-sm" style="width: 100px" href="FindDoctor.aspx?Expertise=Dentist">🦷 Dentist</a>
        &nbsp;
        <a class="btn btn-outline-dark btn-rounded btn-sm" style="width: 150px" href="FindDoctor.aspx?Expertise=Dermatologists">👨‍⚕️ Dermatologists</a>
        &nbsp;
        <a class="btn btn-outline-dark btn-rounded btn-sm" style="width: 100px" href="FindDoctor.aspx?Expertise=Eye">👁️‍🗨️ Eye Care</a>
        &nbsp;
        <a class="btn btn-outline-dark btn-rounded btn-sm" style="width: 100px" href="FindDoctor.aspx?Expertise=All">🔍 All</a>
    </div>


    <div class="row" style="margin-top: 30px">
        <% foreach (var my in filter)
            { %>

        <div class="card" style="width: 16.5em; margin: 10px; background: #93e2bb">
            <div class="row" style="padding-top: 20px; padding-left: 20px; color: navy; font-weight: bold">
                <h6><%= my.Name%></h6>
            </div>
            <div class="row" style="padding-left: 20px">
                <h6><%= my.Expertise %></h6>
            </div>
            <div class="row" style="padding-left: 20px">

                <a style="font-size: 15px">
                    <asp:Label CssClass="badge bg-primary" ID="Label1" runat="server" Text="❤️Loyal Patients">

                    </asp:Label>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                        <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                    </svg>
                    <%= my.rating %>
                </a>

            </div>
            <div class="row" style="padding-left: 20px; padding-top: 10px">
                <h6>📞<%= my.Phone %></h6>
            </div>
            <div class="row" style="padding-left: 20px">
                <a style="font-size: small">📨<%= my.Email %></a>
            </div>
            <br />
            <div class="row" style="padding-left: 20px">
                <p>
                    • New patient appointments
                        <br />
                    • Also offers video visits
                        <br />
                    • Highly recommended
                        <br />
                    • Excellent wait time
                </p>
            </div>
            <hr />
            <div class="row" style="padding-left: 20px; padding-bottom: 20px">
                <div class="col-lg-8">
                    <%--<asp:Button ID="Button2" CssClass="btn btn-outline-dark btn-rounded btn-sm" data-toggle="modal" data-target="#exampleModalCenter" runat="server" ClientIDMode="Static" Text="Appoint Now" />--%>
                    <a href="Reservation.aspx?Email=<%= my.Email%>" class="btn btn-outline-dark btn-rounded btn-sm">Appoint Now</a>
                
                </div>

            </div>

        </div>

        <% } %>
    </div>

</asp:Content>
