<style type="text/css">
html {
    font-family: "Source Code Pro Light", "PT Serif", "Georgia", "Times New Roman", "serif";
    }
@media (min-width: 38em) {
  html {
    font-size: 20px;
  }
}
body {
  color: #515151;
  background-color: #fff;
}

h1, h2, h3, h4, h5, h6, Summary {
    font-family: "Source Code Pro", "PT Sans", "Helvetica", "Arial", "sans-serif";
    font-weight: 400;
    color: #313131;
    letter-spacing: -.025rem;
}
h1 {
  font-size: 2rem;
}
h2 {
  margin-top: 1rem;
  font-size: 1.5rem;
}
h3 {
  margin-top: 1.5rem;
  font-size: 1.25rem;
}
h4, h5, h6 {
  margin-top: 1rem;
  font-size: 1rem;
}
summary {
  margin-top: 1.5rem;
  font-size: 1.25rem;
}

/* Body text */
p {
  margin-top: 0;
  margin-bottom: 1rem;
}

strong {
  color: #303030;
}

.downloads {
    padding: 2em 7em 2em 1em
}

    /* No `:visited` state is required by default (browsers will use `a`) */
a {
    color: #268bd2;
    text-decoration: none;
}
a strong {
    color: inherit;
}
    /* `:focus` is linked to `:hover` for basic accessibility */
a:hover,
a:focus {
    text-decoration: underline;
}
</style>


<!DOCTYPE html>
<html>

<head>   
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <title>Regolith Linux</title>
    <link rel="shortcut icon" href="images/favicon.ico">
</head>
<body>
<h1><img src="images/regolith-logo.png" alt="Regolith-Linux" width="42" height="42" align="left">&nbsp; Regolith Linux</h1>

{{ range .Releases }}
<div class="downloads">
    <h2>{{ .Title }}:</h2>
    <h2>
        <a href="{{ $.BaseURL }}{{ .ISODownloadLink }}" download>Download {{ .Title }}</a>
    </h2>

    <h3>
        <a href="{{ $.BaseURL }}{{ .MD5DownloadLink }}" download>Download {{ .Title }} MD5</a>
    </h3>

    {{ range .Mirrors }}
    <h3>Mirrors:</h3>
    <h3>
      <a href="{{ . }}" download>{{ . }} </a>
    </h3>
    {{ end }}
</div>
{{ end }}

</body>
</html>
