@ECHO OFF
REM =============================================================================
REM _ccdabuild.bat - project controller: OUR steps, then the managed publisher.
REM Ours (not managed by ig-publisher-scripts; safe to maintain).
REM   1. _genexamples.bat  - SUSHI + generate/verify highlighted examples
REM   2. _genonce.bat      - the managed HL7 publisher script (untouched)
REM A failed example check aborts BEFORE the publisher runs.
REM Any arguments are passed through to _genonce.bat.
REM =============================================================================
CALL _genexamples.bat
IF ERRORLEVEL 1 (
  ECHO [ccdabuild] Aborted: example generation/checks failed. Publisher NOT run.
  EXIT /B 1
)
CALL _genonce.bat %*
