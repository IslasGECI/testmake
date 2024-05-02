Describe 'make install'
  It 'copies geci-testmake'
    When call tests/test_make-install.sh
    The line 9 of output should equal '/usr/local/bin/geci-testmake'
  End
  It 'install dependencies'
    When call container-runner --help
    The output should include 'container-runner'
End
