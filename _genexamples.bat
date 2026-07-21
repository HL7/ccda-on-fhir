@ECHO OFF
REM =============================================================================
REM _genexamples.bat - generate + verify the highlighted CDA/FHIR examples.
REM Ours (not managed by ig-publisher-scripts; safe to maintain).
REM Runs SUSHI (the generator reads fsh-generated/), installs script deps on
REM first use, then runs gen-highlighted.js for every correspondence file.
REM Exits non-zero on any value-check failure so callers can abort the build.
REM =============================================================================
SETLOCAL

ECHO [genexamples] Running SUSHI...
CALL npx sushi .
IF ERRORLEVEL 1 EXIT /B 1

IF NOT EXIST scripts\node_modules (
  ECHO [genexamples] Installing script dependencies...
  REM cd into scripts: npm --prefix from the repo root can recursively vendor
  REM the parent package into scripts/node_modules (observed 2026-07-20).
  PUSHD scripts
  CALL npm install --no-audit --no-fund
  POPD
  IF ERRORLEVEL 1 EXIT /B 1
)

FOR %%f IN ("examples-src\correspondence\*.yaml") DO (
  ECHO [genexamples] %%~nf
  node scripts\gen-highlighted.js "%%f"
  IF ERRORLEVEL 1 (
    ECHO [genexamples] FAILED: example checks for %%~nf. Fix the content mismatch;
    ECHO                do not edit files in input\includes\examples by hand.
    EXIT /B 1
  )
)
COPY /Y examples-src\myra-jones-ccd.xml input\images\myra-jones-ccd.xml >NUL
ECHO [genexamples] All example checks passed.
EXIT /B 0

REM Informational coverage report (D-scope-1); never blocks the build.
node scripts\check-coverage.js examples-src\correspondence\CF-medication.yaml examples-src\correspondence\CF-allergy.yaml examples-src\correspondence\CF-problem.yaml examples-src\correspondence\CF-immunization.yaml examples-src\correspondence\CF-procedure.yaml examples-src\correspondence\CF-patient.yaml examples-src\correspondence\CF-vital.yaml
