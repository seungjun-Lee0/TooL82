<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="title"><span class="text-purple">파티/판매</span>  등록</div>

<div class="form-list">
    <div class="form-list form-list-border partner-fomr-list">
        <ul>
            <li>
                <div class="subject">ㆍ 서비스</div>
                <select name="ca_id" id="ca_id" onchange="categorychange2(this.form)">
                    <option value="">기본 분류 선택</option>
                    <option value="1010">영상</option>
                    <option value="1020">음악</option>
                    <option value="1030">게임</option>
                    <option value="1040">유틸</option>
                </select>

                <a href="#" class="ttip">
                    <img src="/src/assets/css/img/tip.png" alt="" />
                    <span class="ttip-text" style="right: -29px; width: 160px">첫 가입시 3등급이며, 벗츠 사용도 및 거래 점수에 따라 등급이 변할 수 있습니다.</span>
                </a>
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
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                </select>
                명
            </li>
            <li>
                <div class="subject">ㆍ 진행 형태</div>
                <span class="input-check">
				<input onclick="fn_check('0');" type="radio" name="viewid_yn" value="0" id="rdo_idview_0" checked="checked">
				<label id="lb_0" for="rdo_idview_0">회선 공유</label>
			</span>
                <span class="input-check">
				<input onclick="fn_check('1');" type="radio" name="viewid_yn" value="1" id="rdo_idview_1" >
				<label id="lb_1" for="rdo_idview_1">가족 요금제 공유</label>
			</span>
                <span class="input-check">
				<input onclick="fn_check('2');" type="radio" name="viewid_yn" value="2" id="rdo_idview_2" >
				<label id="lb_2" for="rdo_idview_2">기기 등록형</label>
			</span>
                <span class="input-check">
				<input onclick="fn_check('3');" type="radio" name="viewid_yn" value="3" id="rdo_idview_3" >
				<label id="lb_3" for="rdo_idview_3">기타</label>
			</span>
                <div id="div_idpw">
                    <input type="text" name="pt_link1" value="" id="pt_link1" class="width-200" size="20" maxlength="35" placeholder="계정 아이디(이메일)">
                    <input type="text" name="pt_link2" value="" id="pt_link2" class="width-200" size="20" maxlength="20" placeholder="패스워드">
                </div>
            </li>
            <li>
                <div class="subject w100">ㆍ 연락처(문의처)</div>
                <span class="input-check">
				<input type="radio" name="contact-type" id="contact-type1" onclick="fn_contact('1');"checked="checked" />
				<label for="contact-type1">전화번호</label>
			</span>
                <span class="input-check">
				<input type="radio" name="contact-type" id="contact-type2" onclick="fn_contact('2');" />
				<label for="contact-type2">카카오톡</label>
			</span>
                <div>
                    <input type="text" class="width-200" name="kakao_id" id="kakao_id" placeholder="연락받을 곳을 입력해 주세요." required value="010-5199-5011" />
                    <div class="lightgrey">이슈 발생 시 대응 가능한 문의정보를 입력해 주세요.</div>
                </div>
            </li>
            <li>
                <div class="subject w100">ㆍ 진행 기간</div>
                <input type="text" name="start_day" id="start_day"  value="2021-06-15" class="width-100" readonly size="8"  maxlength="8"> ~
                <input type="text" name="pt_day" value="종료날짜" id="pt_day" class="width-100" required size="8"  maxlength="8">
                <button type="button" id="btn_enddate" class="button round button-purple" onclick="check_day()">기간 확인</button>

                <span id="lb_enddate" class="text-purple"></span>
            </li>
            <li>
                <div class="subject w100">ㆍ 참여 금액</div>
                1인 당 1일
                <input type="text" name="it_price" value="" id="it_price" class="width-100" required size="10" placeholder=" 금액입력" maxlength="4">
                원 * 예상 총 수령 금액
                <button type="button" id="btn_cash" class="button round button-purple" onclick="check_cash()">금액 확인하기</button>

                <span id="i_cash_c" class="text-purple">예상금액</span>

            </li>
            <li>
                <div class="subject w100">ㆍ 기본 규칙</div>
                <span class="input-check">
				<input type="checkbox" id="chk_a" name="chk_a" />
				<label for="chk_a">19세 이상</label>
			</span>
                <span class="input-check">
				<input type="checkbox" id="chk_b" name="chk_b" />
				<label for="chk_b">1인 1회선</label>
			</span>
                <span class="input-check">
				<input type="checkbox" id="chk_c" name="chk_c" />
				<label for="chk_c">1인 1기기 등록</label>
			</span>
                <span class="input-check">
				<input type="checkbox" id="chk_d" name="chk_d" />
				<label for="chk_d">공유 금지</label>
			</span>
                <span class="input-check">
				<input type="checkbox" id="chk_e" name="chk_e" />
				<label for="chk_e">설정 임의변경 불가</label>
			</span>
                <span class="input-check">
				<input type="checkbox" id="chk_f" name="chk_f" />
				<label for="chk_f">프로필 매너 준수</label>
			</span>
                <span class="input-check">
				<input type="checkbox" id="chk_g" name="chk_g" />
				<label for="chk_g">계정양도 불가</label>
			</span>
                <span class="input-check">
				<input type="checkbox" id="chk_h" name="chk_h" />
				<label for="chk_h">개인사정 환불 불가</label>
			</span>
                <span class="input-check">
				<input type="checkbox" id="chk_i" name="chk_i" />
				<label for="chk_i">위반 시 강제 조치</label>
			</span>
                <span class="input-check">
				<input type="checkbox" id="chk_j" name="chk_j" />
				<label for="chk_j">벗츠 닉네임과 동일하게 프로필 닉네임 설정</label>
			</span>
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