<%@ page import="com.rxlogix.*" %>
<div class="modal-topic">
    <div id="Modal-topic" class="modal">
        <div class="modal-content">
            <div class="mh">Create Topic</div>
            <g:form controller="topic" action="createtopic" params="[id:user.id]">
                <div class="container" style="padding:10px">
                    <div class="form-group">
                        <label for="topicname">Name</label>
                        <g:textField name="topicname" class="input" id="topicname"></g:textField>
                    </div>
                    <br><br>
                    <div class="form-group">
                        <lable for="topicv">Visibility</lable>
                        <select class="box"  name="topicv" >
                            <option value="Public" selected>Public</option>
                            <option value="Private">Private</option>
                        </select>
                    </div>
                    <br><br>
                    <input type="button" value="cancel" class="submit" style="float:right; margin-right:4px;" onclick="document.getElementById('Modal-topic').style.display='none'">
                    <g:submitButton name="createtopic" value="Save"  class="submit" style="float: right; margin-right: 4px;" onclick="document.getElementById('Modal-topic').style.display='none'"></g:submitButton>
                    <br><br>
                </div>
            </g:form>
        </div>
    </div>
</div>

<div class="modal-document">
    <div id="Modal-document" class="modal">
        <div class="modal-content">
            <div class="mh">Share Document</div>
            <g:uploadForm controller="resources" action="createdocresource" params="[id: user.id]">

                <div class="container" style="padding:10px">
                    <label for="docfile">Document</label>
                    <input type="file"  name="docfile" id="docfile" >
                    <br><br>
                    <label for="doc">Description</label>
                    <g:textArea id="doc" name="doc" class = "input"></g:textArea>
                    <br><br>
                    <label for="topicname">Topic</label>
                    <g:select style="max-width: 220px" name="topicname" optionKey="id" optionValue="topicName" from="${Subscription.findAllByCreatedBy(user).topics}"/>
                    <br><br><br>
                    <input type="button" value="cancel" class="submit" style="float:right; margin-right:4px;" onclick="document.getElementById('Modal-document').style.display='none'">
                    <g:submitButton name="docupload" value="Share"  class="submit" style="float: right; margin-right: 4px;" onclick="document.getElementById('Modal-document').style.display='none'"></g:submitButton>
                    <br><br>
                </div>
            </g:uploadForm>
        </div>
    </div>
</div>

<div class="modal-link">
    <div id="Modal-url" class="modal">
        <div class="modal-content">
            <div class="mh">Share Link</div>
            <g:form controller="resources" action="createlinkresource" params="[id:user.id]">
                <div class="container" style="padding:10px">
                    <div class="form-group">
                        <label for="url">Link</label>
                        <g:textField name="url" id="url"/>
                        <br><br>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <g:textArea name="description"/>
                        <br><br>
                    </div>
                    <div class="form-group">
                        <label for="topicname">Topic</label>
                        <g:select style="max-width: 220px" name="topicname" optionKey="id" optionValue="topicName" from="${Subscription.findAllByCreatedBy(user).topics}"/>
                        <br><br>
                    </div>
                    <div class="form-group">
                        <input type="button" value="cancel" class="submit" style="float:right; margin-right:4px;" onclick="document.getElementById('Modal-url').style.display='none'">
                        <g:submitButton name="gLinkUpload" value="Share"  class="submit" style="float: right; margin-right: 4px;" onclick="document.getElementById('Modal-url').style.display='none'"></g:submitButton>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>

<div class="modal-invitation">
    <div id="Modal-invite" class="modal">
        <div class="modal-content">
            <div class="mh">Send Invitation</div>
            <g:form>
                <div class="form-group">
                    <div class="col-sm-2 control-label">Email</div>
                    <div class="col-sm-10">
                        <input type="email" name="email" required placeholder="Enter email" class="form-control col-sm-8" />
                    </div>
                    <br><br>
                </div>
                <div class="form-group">
                    <label for="topicname">Topic</label>
                    <g:select style="max-width: 220px" name="topicname" optionKey="id" optionValue="topicName" from="${Subscription.findAllByCreatedBy(user).topics}"/>
                    <br><br>
                </div>
                <div class="form-group">
                    <input type="button" value="cancel" class="submit" style="float:right; margin-right:4px;" onclick="document.getElementById('Modal-invite').style.display='none'">
                    <g:submitButton name="gLinkUpload" value="Share"  class="submit" style="float: right; margin-right: 4px;" onclick="document.getElementById('Modal-invite').style.display='none'"></g:submitButton>
                </div>
            </g:form>
        </div>
    </div>
</div>