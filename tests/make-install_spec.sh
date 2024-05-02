Describe 'make install'
  setup() { export PATH="$PATH:/root/.local/bin" ; }
  BeforeAll 'setup'
  It 'copies geci-testmake'
    When call geci-testmake --help
    The output should include "Verifica que 'make' puede construir un objetivo"
  End
  It 'install dependencies'
    When call container_runner --help
    The output should include 'container_runner'
  End
End
