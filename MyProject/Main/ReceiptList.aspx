<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="ReceiptList.aspx.cs" Inherits="Main.Invoice" %>
<%@ Import Namespace="CoreProject.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $(".DS").datepicker({
                dateFormat: "yy-mm-dd"
            });
            $(".DE").datepicker({
                dateFormat: "yy-mm-dd"
            });
        });
    </script>
    <style>
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row mb-2">
            <div class="col-md-2 d-flex justify-content-center align-content-center">
                <asp:Button ID="btnCrtRpt" runat="server" Text="新增發票" CssClass="btn btn-primary col-md-8 col-12 my-2" />
            </div>
            
            <div class="col-md-2 offset-md-2">
                <asp:TextBox ID="txtDate" runat="server" placeholder="起始日期" CssClass="form-control col-12 mt-2 DS"></asp:TextBox>
                <asp:TextBox ID="txtDateEnd" runat="server" placeholder="結尾日期" CssClass="form-control col-12 mb-2 DE"></asp:TextBox>
            </div>
            <div class="col-md-2 text-center">
                <asp:Label ID="txtCompany" runat="server" Text="開立公司" CssClass="form-control col-12 mt-2"></asp:Label>
                <asp:DropDownList runat="server" ID="ddlProductType" CssClass="form-control col-12 mb-2">
                <asp:ListItem Text="開立公司" Value=""></asp:ListItem>
                <asp:ListItem Text="7-Eleven" Value="1"></asp:ListItem>
                <asp:ListItem Text="FamilyMart" Value="2"></asp:ListItem>
                <asp:ListItem Text="UBay" Value="3"></asp:ListItem>
                <asp:ListItem Text="GlobalGas" Value="4"></asp:ListItem>
            </asp:DropDownList>
            </div>
            <div class="col-md-2">
                <asp:TextBox runat="server" ID="txtPrice1" placeholder="金額最小值" CssClass="form-control col-12 mt-2"></asp:TextBox>
                <asp:TextBox runat="server" ID="txtPrice2" placeholder="金額最大值" CssClass="form-control col-12 mb-2"></asp:TextBox>
            </div>
            <div class="col-md-2 d-flex justify-content-center align-content-center">
                <asp:Button runat="server" ID="btnSearch" Text="查詢" CssClass="btn btn-secondary col-md-8 col-12 my-2" />
            </div>
        </div>
        
        <hr />

        <div class="table-responsive">
            <table class="table table-striped text-nowrap">
                <thead>
                    <tr>
                        <th>發票號碼</th>
                        <th>日期</th>
                        <th>開立公司</th>
                        <th>金額</th>
                        <th>進/銷項</th>
                        <th>刪除/修改</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repInvoice" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ReceiptNumber") %></td>
                                <td><%# Eval("Date", "{0:yyyy-MM-dd}") %></td>
                                <td><%# Eval("Company") %></td>
                                <td><%# Eval("Amount") %></td>
                                <td><%# (Revenue_Expense)Eval("Revenue_Expense") %></td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="刪除" CommandName="DeleteItem" CommandArgument='<%# Eval("ReceiptNumber") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>

                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
