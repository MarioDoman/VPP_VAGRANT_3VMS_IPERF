*** Settings ***
Library    Process    
Library    OperatingSystem
Library    String


*** Test Cases *** 
Start Vagrant VMS csp2s22c03
    ${result} =  Run Process    vagrant    up    csp2s22c03  shell=True  stdout=vm_start_log_csp2s22c03.txt
    Should Contain  ${result.stdout}    Setting up vpp-plugin-core


Start Vagrant VMS csp2s22c04
    ${result} =  Run Process    vagrant    up    csp2s22c04  shell=True  stdout=vm_start_log_csp2s22c04.txt
    Should Contain  ${result.stdout}    v2.97/trex_client_v2.97.tar.gz



Stop Vagrant VM and check shutdown message
    ${result} =  Run Process    vagrant    halt  shell=True  stdout=vm_shutdown_log.txt
    Should Contain  ${result.stdout}    Attempting graceful shutdown of VM