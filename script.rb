def compile_haml
### COMPONENTS ###
    %x[haml components/haml/header.haml components/php/header.php]
    %x[haml components/haml/sidebar.haml components/php/sidebar.php]
    %x[haml components/haml/footer.haml components/php/footer.php]

### PAGES ###
    %x[haml pages/haml/home.haml pages/php/home.php]

end

watch(".*\.haml$") { |x|
  compile_haml
}