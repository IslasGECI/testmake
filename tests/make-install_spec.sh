Describe 'make install'
  It 'copies geci-testmake'
    When call tests/test_make-install.sh
    The line 6 of output should equal '/usr/local/bin/geci-testmake'
  End
End
