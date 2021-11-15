function CheckAddProduct() { //1.기본 유효성 검사 (빈칸확인/길이제한/숫자여부)

	var bookId = document.getElementById("bookId");
	var bName = document.getElementById("bName");
	var bPrice = document.getElementById("bPrice");
	var bInStock = document.getElementById("bInStock");
	
	if (!check(/^b[0-9]{14}$/, bookId, "[도서코드]\nb와 13자리 숫자를 조합하여 입력하세요\n첫 글자는 반드시 b로 시작하세요"))
		return false;

	if (bName.value.length < 1 || bName.value.length > 20) {
		alert("[도서명]\n최소 1자에서 최대 20자까지 입력하세요");
		bName.select();
		bName.focus();  //selct()와 focus()의 차이
		return false;   //false를 해주지 않으면 .submit()이 유효하게 됨.
	}
//도서 가격은 빈칸(.value.length) / 숫자(isNAN) 확인 / 양수(.value<0)인지 두 개의 if문으로 확인 할 것!
	if (bPrice.value.length == 0 || isNaN(bPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		bPrice.select();
		bPrice.focus();
		return false;
	}
	if (bPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		bPrice.select();
		bPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, bPrice, "[가격]\n소수점 둘째 자리까지만 입력하세요"))
		return false; //다른 화폐 단위 이용시 필요

	if (isNaN(bInStock.value)) {
		alert("[재고수]\n숫자만 입력하세요");
		bInStock.select();
		bInStock.focus();
		return false;
	}

//2. 데이터형식 유효성검사 - 정규표현식 check() 함수 작성
	function check(regExp, e, msg) { 
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	 document.newBook.submit()

}