class HtmlGenerator
  def generate_html(content, bypass_html = true, file_name = 'index.html')
    content = content.gsub(/[<>]/, '') if bypass_html

    html = <<-HTML
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <title>#{ file_name }</title>
    </head>
    <body>
      #{ content }
    </body>
    HTML

    File.open(file_name, 'w+') do |f|
      f.write(html)
    end
    system("xdg-open #{Dir.pwd}/#{file_name}")
  end
end