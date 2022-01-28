Describe 'geci-testmake'
  It 'Requires TABLERO_API_SECRET_KEY'
    unset TABLERO_API_SECRET_KEY
    When call src/geci-testmake hola mundo
    The line 8 of stdout should equal 'La variable de entorno <TABLERO_API_SECRET_KEY> no esta definida'
    The status should be failure
  End

  Mock mkdir
    exit 0
  End

  It 'Accepts TABLERO_API_SECRET_KEY'
    export TABLERO_API_SECRET_KEY=dummy_key
    When call src/geci-testmake hola mundo
    The line 8 of stdout should equal 'La variable de entorno <TABLERO_API_SECRET_KEY> esta definida,'
    The status should be failure
  End

   It 'Verify that directory is empty'
    export TABLERO_API_SECRET_KEY=dummy_key
    When call src/geci-testmake hola mundo
    The line 15 of stdout should equal '/root/.testmake/hola [ OK ]'
  End

  It 'Verify that directory is not empty'
    export TABLERO_API_SECRET_KEY=dummy_key
    When call src/geci-testmake hola mundo
    The line 15 of stdout should equal 'ERROR: No pude preparar /root/.testmake/hola como directorio de trabajo'
    The status should be failure
  End

End
