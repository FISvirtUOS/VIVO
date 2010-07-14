<%-- $This file is distributed under the terms of the license in /doc/license.txt$ --%>

<jsp:include page="roleShortView.jsp">
	<jsp:param name="personToRolePredicate" value="http://vivoweb.org/ontology/core#hasClinicalRole"/>
	<jsp:param name="roleToPersonPredicate" value="http://vivoweb.org/ontology/core#clinicianRoleOf"/>
	<jsp:param name="roleActivityToRolePredicate" value="http://vivoweb.org/ontology/core#relatedRole"/>
	<jsp:param name="roleActivityLabel" value="clinical role"/>
	<jsp:param name="roleLabelForPerson" value="USE_MONIKER"/>
</jsp:include>
