# Cybersecurity Playbook - SOC: Monitoring Work roles

## Virus File Investigations
- Potential Scenarios:
    + An infected PDF file was found

- Triage
    + Isolate the PDF file in a virtual machine/bare metal that is isolated from the network
    + Hash the file to obtain the Hash hexdigest
    + Copy the hash into a Virus Database (i.e. VirusTotal) to identify if the file is positively infected, or if it is a false positive

- Cyber Threat Analysis
    - If the file is positively contains a virus
        + Keep the file isolated, perform Malware Analysis and virus identification from the Virtual Machine/Isolated Machine

## Resources

## References

## Remarks

