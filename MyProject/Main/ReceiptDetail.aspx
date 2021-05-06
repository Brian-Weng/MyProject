<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="ReceiptDetail.aspx.cs" Inherits="Main.ReceiptDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script>
        $(document).ready(function () {
            $("#txtDate").datepicker({
                dateFormat: "yy-mm-dd"
            });
        });
    </script>
    <style>
        .containerRD{
            border-radius: 10px; 
            box-shadow: -5px -5px 10px #fff, 5px 5px 10px #babebc;
            /*background-color:lightgrey;*/
        }
        .left{
            float:left;
            width:100px;
            font-size:20px;
        }
        .right{
            width:calc(100% - 100px);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-center align-items-center" style="height:80vh">
            <div class="col-md-6 bg-light containerRD p-3">
                        <div class="d-flex justify-content-center p-1">
                            <h3>新增發票</h3>
                        </div>
                        <div class="form-group p-1">
                            <label class="left">發票號碼：</label>
                            <input type="text" class="right form-control" value="Name">
                        </div>
                        <div class="form-group p-1">
                            <label class="left">日期：</label>
                            <input type="text"id="txtDate" class="right form-control" value="Date">
                        </div>
                        <div class="form-group p-1">
                            <label class="left">開立公司：</label>
                            <asp:DropDownList ID="dpdCompany" runat="server">
                                <asp:ListItem Text="FamilyMart" Value="1"></asp:ListItem>
                                <asp:ListItem Text="7-Eleven" Value="2"></asp:ListItem>
                                <asp:ListItem Text="GlobalGas" Value="3"></asp:ListItem>
                                <asp:ListItem Text="UBay" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group pt-1 px-1">
                            <label class="left">金額：</label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="right form-control" MaxLength="10" TextMode="Number" min="1" max="9999999"></asp:TextBox>
                        </div>
                </div>
        </div>
    </div>
</asp:Content>
