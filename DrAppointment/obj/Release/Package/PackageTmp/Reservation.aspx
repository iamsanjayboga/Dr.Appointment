<%@ Page Title="Reservation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reservation.aspx.cs" Inherits="DrAppointment.Reservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row" style="margin-top:100px">
        <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4">
            <div class="card" style="width: 16.5em; margin: 10px; background: #93e2bb">
                <div class="row" style="padding-top: 20px; padding-left: 20px; color: navy; font-weight: bold">
                    <asp:Label ID="name" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="row" style="padding-left: 20px">
                    <asp:Label ID="expertise" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="row" style="padding-left: 20px">

                    <a style="font-size: 15px">
                        <asp:Label CssClass="badge bg-primary" ID="Label1" runat="server" Text="❤️Loyal Patients">

                        </asp:Label>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                            <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                        </svg>
                        <asp:Label ID="rating" runat="server" ClientIDMode="Static" style="font-size: small" Text="Label"></asp:Label>
                    </a>

                </div>
                <div class="row" style="padding-left: 20px; padding-top: 10px">
                    <asp:Label ID="phone" runat="server" Text="📞"></asp:Label>
                    
                </div>
                <div class="row" style="padding-left: 20px">
                    
                    <asp:Label ID="lblemail" runat="server" ClientIDMode="Static" style="font-size: small" Text="📨"></asp:Label>
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
                    </div>

                </div>

            </div>
        </div>

        <div class="col-sm-1 col-md-1 col-lg-1 col-xl-1"></div>
        <!--Empty column-->

        <div class="col-sm-7 col-md-7 col-lg-7 col-xl-7">
            <!--Form-->
            <%--<form id="survey-form">--%>
            <h1 id="title">Book an appointment for free</h1>
            <div class="form-group">
                <label for="name">Name</label>
                <%--<input type="name" class="form-control" placeholder="Enter name" id="name">--%>
                <asp:TextBox ID="patientname" CssClass="form-control" placeholder="Enter name" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="email">Email address:</label>
                <asp:TextBox ID="patientemail" CssClass="form-control" placeholder="Enter email" runat="server"></asp:TextBox>
                <%--<input type="email" class="form-control" placeholder="Enter email" id="email">--%>
            </div>
            <div class="form-group">
                <label for="age">Age</label>
                <%--<input type="age" class="form-control" placeholder="Enter age" id="age">--%>
                <asp:TextBox ID="patientage" CssClass="form-control" placeholder="Enter age" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="dropdown">How often do you get a health checkup?</label>
                <asp:DropDownList ID="healthcheckup" runat="server" CssClass="custom-select">
                    <asp:ListItem Text="Once in 3 months" Value="Once in 3 months"></asp:ListItem>
                    <asp:ListItem Text="Once in 6 months" Value="Once in 6 months"></asp:ListItem>
                    <asp:ListItem Text="Once a year" Value="Once a year"></asp:ListItem>
                    <asp:ListItem Text="Only when needed" Value="Only when needed"></asp:ListItem>
                    <asp:ListItem Text="Never get it done" Value="Never get it done"></asp:ListItem>
                </asp:DropDownList>

            </div>

            <div class="form-group">
                <label for="dropdown">Do you have any hereditary conditions/diseases?</label>
                <asp:DropDownList ID="condition" runat="server" CssClass="custom-select">
                    <asp:ListItem Text="High blood pressure" Value="High blood pressure"></asp:ListItem>
                    <asp:ListItem Text="Diabetes" Value="Diabetes"></asp:ListItem>
                    <asp:ListItem Text="Hemophilia" Value="Hemophilia"></asp:ListItem>
                    <asp:ListItem Text="Thalassemia" Value="Thalassemia"></asp:ListItem>
                    <asp:ListItem Text="Huntington" Value="Huntington"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="dropdown">Are you habitual to drugs and alcohol?</label>
                <asp:DropDownList ID="drug" runat="server" CssClass="custom-select">
                    <asp:ListItem Text="Yes to both" Value="Yes to both"></asp:ListItem>
                    <asp:ListItem Text="Only to drugs" Value="Only to drugs"></asp:ListItem>
                    <asp:ListItem Text="Only to alcohol" Value="Only to alcohol"></asp:ListItem>
                    <asp:ListItem Text="I am not habituated to either" Value="I am not habituated to either"></asp:ListItem>

                </asp:DropDownList>

            </div>

            <div class="form-group">
                <label for="dropdown">How would you evaluate your overall health? Would you say you are:</label>
                <asp:DropDownList ID="overall" runat="server" CssClass="custom-select">
                    <asp:ListItem Text="In good physical health (No illness or disabilities)" Value="In good physical health (No illness or disabilities)"></asp:ListItem>
                    <asp:ListItem Text="Mildy physically impaired. (Minor illness or disabilities)" Value="Mildy physically impaired. (Minor illness or disabilities)"></asp:ListItem>
                    <asp:ListItem Text="Moderately physically impaired. (Requires substantial treatment)" Value="Moderately physically impaired. (Requires substantial treatment)"></asp:ListItem>
                    <asp:ListItem Text="Severely physically impaired. (Requires extensive treatment)" Value="Severely physically impaired. (Requires extensive treatment)"></asp:ListItem>
                    <asp:ListItem Text="Totally physically impaired. (Confined to bed)" Value="Totally physically impaired. (Confined to bed)"></asp:ListItem>
                </asp:DropDownList>

            </div>

            <div class="form-group">
                <asp:TextBox ID="datetimeappo" CssClass="dateandtime" runat="server"></asp:TextBox>
                 <%--<input id="datetimeappo" class="dateandtime" runat="server" type="text" name="bidule-b" value="">--%>
            </div>

            <div class="form-group">
                <label for="comment">Any information to share with Doctor? (Optional)</label>
                <asp:TextBox ID="comments" runat="server" CssClass="form-control" TextMode="MultiLine" Height="100"></asp:TextBox>
                <%--<textarea class="form-control" rows="5" runat="server" id="comment" name="text" placeholder="Enter your comment here..."></textarea>--%>
            </div>
<%--            <button type="submit" class="btn btn-warning" style="width: 100%;">Submit</button>--%>
            <asp:Button ID="Button1" CssClass="btn btn-warning" style="width: 100%;" OnClick="ScheduleAppointment" ClientIDMode="Static"  runat="server" Text="Submit" />
            <%--</form>--%>
        </div>


    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
    <script type="text/javascript" src="Content/js/jquery.dateandtime.js"></script>
    <script type="text/javascript">
        // Call plugin
        $('.example').dateAndTime();
        $('.dateandtime').dateAndTime();

    </script>


</asp:Content>
