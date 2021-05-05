<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="ReceiptList.aspx.cs" Inherits="Main.Invoice" %>
<%@ Import Namespace="CoreProject.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        
    </style>
    <div class="mb-2">
        <a href="#"><button type="button" id="btnCreateRe" class="btn btn-primary">新增發票</button></a>
    </div>
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
                            <asp:Button ID="Button1" runat="server" Text="刪除" CommandName="DeleteItem" CommandArgument='<%# Eval("ReceiptNumber") %>'/>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>

            </tbody>
        </table>
    </div>

</asp:Content>
