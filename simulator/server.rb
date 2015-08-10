require 'sinatra'

set :public_folder, './simulator'

get '/' do
  <<-HTML
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Hex Simulator</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
    <form action="/" method="post">
      <textarea name="input" placeholder="Input"></textarea><br/>
      <textarea name="output" placeholder="Output"></textarea><br/>
      <button>Run simulation</button>
    </form>
  </body>
</html>
  HTML
end

post '/' do
  <<-HTML
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Hex Simulator</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
  </body>
  <script type="text/javascript" src="elm.js"></script>
  <script type="text/javascript">
    // var main = Elm.fullscreenDebug('Simulator', 'Simulator.elm');
    var main = Elm.fullscreen(Elm.Simulator, {
      submittedInput: '#{params[:input]}',
      submittedOutput: '#{params[:output]}'
    });
  </script>
</html>
  HTML
end
