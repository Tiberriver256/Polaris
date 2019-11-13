#
# Copyright (c) Microsoft. All rights reserved.
# Licensed under the MIT license. See LICENSE file in the project root for full license information.
#

Import-Module -Name $PSScriptRoot\..\..\Polaris.psd1

Describe "Test webserver use" {

    Context "Test starting and stopping of the server" {

        It "Should allow starting and stopping the server" {
            $Port = Get-Random -Minimum 8000 -Maximum 8999
            $Polaris = Start-Polaris -Port $Port
            Stop-Polaris
            $Polaris.Listener.IsListening | Should Be $false

            $Polaris = Start-Polaris -Port $Port
            $Polaris.Listener.IsListening | Should be $true
        }

        It "Should allow running Start-Polaris multiple times without error" {
            $Port = Get-Random -Minimum 8000 -Maximum 8999
            $Polaris = Start-Polaris -Port $Port
            $Polaris.Listener.IsListening | Should Be $false

            $Polaris = Start-Polaris -Port 9998
            $Polaris.Listener.IsListening | Should be $true
        }
    }
}
