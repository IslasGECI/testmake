Describe 'make install'
  It 'copies geci-testmake'
    When call tests/test_make-install.sh
    The line 6 of output should equal '/usr/local/bin/geci-testmake'
  End
End

Describe 'version'
  It 'return version of geci-testmake'
    When call src/geci-testmake --version
    The line 1 of output should start with 'geci-testmake v0.4.0+'
  End
End
