<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="title"><span class="text-purple">판매</span>  등록</div>

<div class="form-list">
    <div class="form-list form-list-border partner-fomr-list">
        <ul>
            <li>
                <div class="subject">ㆍ 서비스</div>
                <select name="ca_id" id="ca_id" onchange="">
                    <option value="">기본 분류 선택</option>
                    <option value="1010">영상</option>
                    <option value="1020">음악</option>
                    <option value="1030">게임</option>
                    <option value="1040">유틸</option>
                </select>
            </li>
            <li>
                <div class="subject">ㆍ 제목</div>
                <input type="hidden" name="pt_tag" value="" id="pt_tag">
                <input type="text" name="it_name" value="" id="it_name" required class="width-400" size="50"  placeholder="제목을 입력해 주세요" >
            </li>
            <li>
                <div class="subject">ㆍ 모집인원</div>
                <select name="it_stock_qty" id="it_stock_qty"class="width-100" value="">
                    <option value="0">총 인원수</option>
                    <option value="0">10</option>
                    <option value="1">15</option>
                    <option value="2">20</option>
                    <option value="3">25</option>
                    <option value="4">30</option>
                    <option value="5">35</option>
                    <option value="6">40</option>
                    <option value="7">45</option>
                    <option value="8">50</option>
                </select>
                명
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
                    <div class="lightgrey">이슈 발생 시 대응 가능한 문의처를 입력해 주세요.</div>
                </div>
            </li>
            <li>
                <div class="subject w100">ㆍ 진행 기간</div>
                <input type="date" name="start_day" id="start_day" class="width-100" size="8"  maxlength="8"> ~
                <input type="date" name="pt_day" id="pt_day" class="width-100" size="8"  maxlength="8">

            </li>
            <li>
                <div class="subject w100">ㆍ 정가</div>
                <input type="text" name="it_price" value="" id="originprice" class="width-100" required size="10" placeholder=" 금액입력" maxlength="4">원
                <div class="lightgrey">할인율을 나타내기 위한 정가를 입력해주세요.</div>
            </li>
            <li>
                <div class="subject w100">ㆍ 판매가</div>
                <input type="text" name="it_price" value="" id="it_price" class="width-100" required size="10" placeholder=" 금액입력" maxlength="4">
                원
            </li>
            <li>
                <div class="subject w100">ㆍ 로고 이미지</div>
                <div>
                    <input type="file" name="logo" id="logo"
                           class="custom-file-input">
                    <label class="custom-file-label" style="margin-left:120px; width: 300px;">
                        첨부할 파일을 선택하세요
                    </label>
                    <div class="lightgrey">40x40 사이즈로 자동으로 맞춰집니다.</div>
                </div>
            </li>
            <li>
                <div class="subject w100">ㆍ 제품 상세 이미지</div>
                <div>
                <input type="file" name="file" id="file"
                       class="custom-file-input">
                <label class="custom-file-label" style="margin-left:120px; width: 300px;">
                    첨부할 파일을 선택하세요
                </label>
                </div>
            </li>
            <li>
                <div class="subject w100">ㆍ 상세 내용 입력</div>
                <textarea name="it_explan" id="it_explan" rows="10"></textarea>
            </li>
        </ul>
    </div>
</div>

<div class="button-align centerbutton-align center">
    <a href="/"><button type="button" class="button border button-purple">목록</button></a>
    <a href="/"><button type="button" class="button border button-purple">등록</button></a>
</div>