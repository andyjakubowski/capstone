// customElements.define('color-box',
//   class ColorBox extends HTMLElement {
//     constructor() {
//       super();

//       const template = document.getElementById('color-box');
//       const templateContent = template.content;
//       const shadowRoot = this.attachShadow({ mode: 'open' });
//       shadowRoot.appendChild(templateContent.cloneNode(true));
//     }
//   }
// );

const template = document.getElementById('color-box');
const templateContent = template.content;
let data;

const headers = new Headers({ 'Origin': 'http://localhost:4567/' });
fetch('http://localhost:4567/', { headers: headers })
  .then((res) => res.json())
  .then((jsonData) => {
    data = jsonData;
    render(jsonData);
  });

function render(data) {
  data.forEach((colorObject) => {
    const clone = templateContent.cloneNode(true);
    const article = clone.querySelector('article');
    const heading = clone.querySelector('h1');
    article.style.backgroundColor = Object.values(colorObject)[0];
    heading.textContent = Object.keys(colorObject)[0];
    document.body.append(clone);
  });
}
