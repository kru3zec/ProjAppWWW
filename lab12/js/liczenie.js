function licz(pole) {
    let miara = pole.className;
    let ile = pole.value;
    let podstawa = parseInt(pole.getAttribute("base"));
     
    let rodzaj = document.getElementsByClassName(miara);
    for(let k=0; k<rodzaj.length; k++) {
        let przelicznik = rodzaj[k].getAttribute("base");
        rodzaj[k].value = ile*podstawa/przelicznik;
    }
}