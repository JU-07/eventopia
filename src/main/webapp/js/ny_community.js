//내용
document.querySelectorAll(".attention-title").forEach((title) => {
  title.addEventListener("click", () => {

    const targetId = title.getAttribute("data-target");
    const content = document.getElementById(targetId);

    if (content) {
      
      content.classList.toggle("open");

      if (content.classList.contains("open")) {
        title.textContent = title.textContent.replace("▽", "△");
      } else {
        title.textContent = title.textContent.replace("△", "▽");
      }
    }
  });
});

document.querySelectorAll('.list-title').forEach((title) => {
  title.addEventListener('click', () => {
    const targetId = title.dataset.target;
    const content = document.getElementById(targetId);

    if (content.classList.contains('open')) {
      content.classList.remove('open');
      title.innerHTML = title.innerHTML.replace('△', '▽');
    } else {
      content.classList.add('open');
      title.innerHTML = title.innerHTML.replace('▽', '△');
    }
  });
});



//위에 돌아가기
const backToTopButton = document.getElementById('backToTop');

window.addEventListener('scroll', function () {
    if (window.scrollY > 300) {
        backToTopButton.style.display = 'block';
    } else {
        backToTopButton.style.display = 'none';
    }
});

backToTopButton.addEventListener('click', function () {
    window.scrollTo({
        top: 0,        
        behavior: 'smooth'
    });
});
