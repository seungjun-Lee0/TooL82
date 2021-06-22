
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-70 out-align-center">
    <div class="row font-big in-align-center">
        아이디 찾기
    </div>
    <div class="row">
        <form action="find_id.it, find_pw.it" method="post">
            <table class="table table-noline" >
                <tbody>
                <tr>
                    <th>이름</th>
                    <td>
                        <input class="form-input form-input-full" type="text" name="name" required>
                    </td>
                </tr>
                <tr>
                    <th>가입 이메일</th>
                    <td>
                        <input type="text" class="width-200" name="email2" id="email2" class="form-control border-danger col-2" readonly>
                        <select class="width-200" id="email3">
                            <option>-선택하세요-</option>
                            <option>직접입력하기</option>
                            <option>naver.com</option>
                            <option>gmail.com</option>
                            <option>hotmail.com</option>
                        </select>
                        </li>
                    </td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <th colspan="2">
                        <input class="form-btn form-btn-full" type="submit" value="찾기">
                    </th>
                </tr>
                </tfoot>
            </table>
        </form>
    </div>
</div>
