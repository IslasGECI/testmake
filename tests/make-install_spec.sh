Describe 'make install'
  It 'copies geci-testmake'
    When call geci-testmake --help
    The output should include "Verifica que 'make' puede construir un objetivo"
  End
  It 'install dependencies'
    When call container-runner --help
    The output should include 'container-runner'
  End
End
