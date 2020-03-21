const TokenHub = (function makeTokenHub() {
  const Button = (function makeButton() {
    let domElement;
    let status;

    const expand = function expand() {
      domElement.classList.add('token-button_expanded');
      status = 'expanded';
      List.expand();
    };

    const collapse = function collapse() {
      domElement.classList.remove('token-button_expanded');
      status = 'collapsed';
      List.collapse();
    };

    const clickHandler = function clickHandler(e) {
      switch (status) {
        case 'collapsed':
          expand();
          break;
        case 'expanded':
          collapse();
          break;
        default:
          console.log('Button has unknown status.');
      }
    };

    return {
      domElement() {
        return domElement;
      },

      init() {
        status = 'collapsed';
        domElement = document.querySelector('.token-button');
        domElement.addEventListener('click', clickHandler);
      },
    };
  }());

  const List = (function makeList() {
    let domElement;
    let status;

    const expand = function expand() {
      domElement.classList.add('token-list_expanded');
      status = 'expanded';
    };

    const collapse = function collapse() {
      domElement.classList.remove('token-list_expanded');
      status = 'collapsed';
    };

    return {
      expand() {
        expand();
      },

      collapse() {
        collapse();
      },

      domElement() {
        return domElement;
      },

      init() {
        status = 'collapsed';
        domElement = document.querySelector('.token-list');
      },
    };
  }());

  return {
    button: Button,

    init() {
      Button.init();
      List.init();
    },
  };
}());

if (document.readyState !== 'loading') {
  TokenHub.init();
} else {
  document.addEventListener('DOMContentLoaded', TokenHub.init)
}