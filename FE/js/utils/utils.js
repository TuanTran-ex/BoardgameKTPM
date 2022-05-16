const utils = {
    formatMoney(money) {
        let formatMoney = "";
        const moneyStr = money.toString();
        for (let i = 0; i < moneyStr.length; i++) {
            if (i !== 0 && (moneyStr.length - i) % 3 === 0) {
                formatMoney += ".";
            }
            formatMoney += moneyStr[i];
        }
        return formatMoney;
    },
    setCookie(cname, cvalue, exdays) {
        const d = new Date();
        d.setTime(d.getTime() + exdays * 24 * 60 * 60 * 1000);
        let expires = "expires=" + d.toUTCString();
        document.cookie = `${cname}=${cvalue};${expires};path=/`;
    },
    getCookie(cname) {
        let name = cname + "=";
        let decodedCookie = decodeURIComponent(document.cookie);
        let ca = decodedCookie.split(";");
        for (let i = 0; i < ca.length; i++) {
            let c = ca[i];
            while (c.charAt(0) == " ") {
            c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
            }
        }
        return "";
    },
    removeCookie(cname) {
        this.setCookie(cname, "", -1);
    },
    setSession(name, value) {
        window.sessionStorage[name] = JSON.stringify(value);
    },
    getSession(name) {
        if (window.sessionStorage[name]) {
            return JSON.parse(window.sessionStorage[name]);
        } else 
            return null;
    },
    removeItemSession(name) {
        window.sessionStorage.removeItem(name);
    },
    calculationPrice(productList, voucher) {
        let totalPrice = 0;
        productList.forEach((item) => {
            totalPrice += item.price * item.quantity;
        });
        return {
            totalPrice: totalPrice,
            savingPrice: Math.floor((totalPrice * voucher) / 100),
            lastPrice: Math.floor(totalPrice * (1 - voucher / 100)),
        };
    },
    detachAddress(address) {
        const item = address.split(", ");
        return {
            province: item[3],
            district: item[2],
            ward: item[1],
            addressDetail: item[0],
        }
    }
}

export default utils