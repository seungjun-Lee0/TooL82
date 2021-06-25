<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="fname" value="${fn:split(pd.fnames,'/')}" />

<div class="title"><span class="text-purple">판매</span>  수정</div>

<div class="form-list">
    <form name="updatefrm" id="updatefrm">
        <div class="form-list form-list-border partner-fomr-list">
            <ul>
                <li>
                    <div class="subject">ㆍ 서비스</div>
                    <select name="category" id="category">
                        <option value="">기본 분류 선택</option>
                        <option value="v">영상</option>
                        <option value="m">음악</option>
                        <option value="g">게임</option>
                        <option value="u">유틸</option>
                    </select>
                    <div class="lightgrey" id="cat_warn"></div>
                </li>
                <li>
                    <div class="subject">ㆍ 제목</div>
                    <input type="text" name="title" value="${pd.title}" id="title" required class="width-400" size="50"
                           placeholder="제품 이름" maxlength="20" >
                    <div class="lightgrey" id="tit_warn">최대 글자 20자를 넘지 않게 해주세요.</div>
                </li>
                <li>
                    <div class="subject w100">ㆍ 마감 날짜</div>
                    <input type="text" name="edate" id="edate" class="width-100" size="8" readonly>
                    <div class="lightgrey" id="dt_warn">시작 날짜는 판매 등록한 날짜로 자동 설정되며, 수정이 불가합니다.</div>
                </li>
                <li>
                    <div class="subject">ㆍ 모집인원</div>
                    <input type="text" name="party" value="${pd.party}" id="party" required class="width-400" size="50"  placeholder="총 인원수" minlength="2" maxlength="3">
                    명
                    <div class="lightgrey" id="prt_warn"></div>
                </li>
                <li>
                    <div class="subject w100">ㆍ 이메일(문의처)</div>
                    <div>
                        <input type="text" class="width-200" name="email1" id="email1" placeholder="이메일을 입력해주세요." required value="" />
                        <span class="lightgrey at">@</span>
                        <input type="text" class="width-200" name="email2" id="email2" class="form-control border-danger col-2" readonly>
                        <select class="width-200" id="email3">
                            <option>-선택하세요-</option>
                            <option>직접입력하기</option>
                            <option>naver.com</option>
                            <option>gmail.com</option>
                            <option>hotmail.com</option>
                        </select>
                        <div class="lightgrey" id="em_warn">이슈 발생 시 대응 가능한 문의처를 입력해 주세요.</div>
                    </div>
                </li>
                <li>
                    <div class="subject w100">ㆍ 정가</div>
                    <input type="text" name="oprice" value="${pd.oprice}" id="oprice" class="width-100" required size="10" placeholder=" 금액입력">원
                    <div class="lightgrey" id="op_warn">할인율을 나타내기 위한 정가를 입력해주세요.</div>
                </li>
                <li>
                    <div class="subject w100">ㆍ 판매가</div>
                    <input type="text" name="sprice" value="${pd.sprice}" id="sprice" class="width-100" required size="10" placeholder=" 금액입력">
                    원
                    <div class="lightgrey" id="sp_warn"></div>
                </li>
                <li>
                    <div class="subject w100">ㆍ 로고 이미지</div>
                    <div>
                        <span class="custom-checkbox">
                            <input type="checkbox" id="die1" class="custom-control-input">
                            <label for="die1" class="custom-control-label"></label>
                        </span>
                        <input type="file" name="img" id="img1"
                               class="custom-file-input" style="width: 300px" disabled>
                        <label class="custom-file-label" style="margin-left:120px; width: 300px;">
                            ${fname[0]}
                        </label>
                        <div class="lightgrey">40x40 사이즈로 자동으로 맞춰집니다.</div>
                        <div id="img1_warn"></div>
                    </div>
                </li>
                <li>
                    <div class="subject w100">ㆍ 제품 이미지</div>
                    <div>
                        <span class="custom-checkbox">
                            <input type="checkbox" id="die2" class="custom-control-input">
                            <label for="die2" class="custom-control-label"></label>
                        </span>
                        <input type="file" name="img" id="img2"
                               class="custom-file-input" style="width: 300px" disabled>
                        <label class="custom-file-label" style="margin-left:120px; width: 300px;">
                            ${fname[1]}
                        </label>
                        <div id="img2_warn"></div>
                    </div>
                </li>
                <li>
                    <div class="subject w100">ㆍ 상세 내용 입력</div>
                    <textarea name="contents" id="contents" rows="10">${pd.contents}</textarea>
                </li>
            </ul>
        </div>

        <div class="button-align centerbutton-align center">
            <a href="/"><button type="button" class="button border button-purple">목록</button></a>
            <button type="button" class="button border button-purple" id="updateokbtn">등록</button>
        </div>

        <input type="hidden" name="email" id="email">
        <input type="hidden" name="cpartied" id="cpartied" value="0">
        <input type="hidden" name="userid" id="userid" value="anonymous">

        <%-- 첨부파일 수정여부를 저장하기 위한 변수 --%>
        <input type="hidden" name="todie" id="todie">
        <%-- uuid를 저장하기 위한 변수--%>
        <input type="hidden" name="uuid" id="uuid" value="${pd.uuid}">
        <input type="hidden" name="pno" id="pno" value="${pd.pno}">
    </form>

</div>

