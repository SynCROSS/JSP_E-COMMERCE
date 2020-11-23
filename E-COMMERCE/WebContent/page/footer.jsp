<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>
  Copyright &copy; <span></span> Made By
  <a
    href="https://github.com/SynCROSS/"
    target="_blank"
    rel="noopener noreferrer"
    >SynCROSS</a
  >
</footer>
<script>
  const span = document.querySelector('span');
  span.innerText = new Date().getFullYear();
</script>