// Texto a animar
const texto = document.getElementById('texto-a-animar').textContent;

// Limpia el texto del H1
document.getElementById('texto-a-animar').textContent = '';

let i = 0;

function escribirTexto() {
    // Agrega un carácter del texto en cada iteración
    document.getElementById('texto-a-animar').textContent += texto.charAt(i);
    i++;

    // Detiene la animación al final del texto
    if (i > texto.length) {
        clearInterval(intervalo);
    }
}

// Intervalo para la animación
const intervalo = setInterval(escribirTexto, 100); // Cambia el valor para modificar la velocidad de escritura
