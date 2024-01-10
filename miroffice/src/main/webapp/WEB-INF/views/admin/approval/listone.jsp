<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<div id ="approvalOne">
  <input type="text" th:value="${dto.appTitle }">
  <input type="text" th:value="${dto.appText }">
	    

</div>
</html>