<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetVerAlign</span>
</h1>

<h4 class="header-gray" id="SetVerAlign">SetVerAlign(sRelativeFrom<sub>opt</sub>, sAlign<sub>opt</sub>)</h4>
<p class="dscr">Specify how the floating object will be vertically aligned.</p>

<h2>Parameters:</h2>
            <table class="table">
                <thead>
                    <tr class="tablerow">
                        <td>Name</td>
                        <td>Type</td>
                        <td>Attributes</td>
                        <td>Default</td>
                        <td>Description</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td><em>sRelativeFrom</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#RelFromV">RelFromV</a>
                        </td>
                        <td>&lt;optional><br>
                        </td>
                        <td>"page"
                        </td>
                        <td>The document element which will be taken as a countdown point for the object vertical alignment.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>sAlign</em></td>
                        <td>
                            <em>"top"</em>
                            |
                            <em>"bottom"</em>
                            |
                            <em>"center"</em>
                        </td>
                        <td>&lt;optional><br>
                        </td>
                        <td>"top"
                        </td>
                        <td>The alingment type which will be used for the object vertical alignment.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oGs1, oGs2, oFill, oStroke, oDrawing, oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with a shape. ");
oParagraph.AddText("The text wraps the rectangular box that bounds the object. ");
oParagraph.AddText("The distance between the shape and the text (horizontally) is half an inch (457200 English measure units).");
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(155, 64, 1), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 1908000, 1404000, oFill, oStroke);
oDrawing.SetDistances(457200, 457200, 457200, 0);
oDrawing.SetWrappingStyle("square");
oDrawing.SetVerAlign("page", "top");
oParagraph.AddDrawing(oDrawing);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("The shape is aligned to the top of the page.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetVerAlign.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887496&doc=S1pKdStzQU1ReTJRQUdZUjRBUFlWMko1QUpOSXc3NEZIanNvclBhZlpROD0_IjQ4ODc0OTYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>