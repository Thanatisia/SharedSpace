# Vulnerabilities

## Types of Vulnerabilities

### Types of Vulnerabilities Based on Location
- Remote Vulnerability
    + An attacker having no prior access to a system, but is able to trigger the execution of a piece of code over the network
    + This allows an attacker to gain remote access to the system without having to deal with physical and/or local contacts
    
- Local Vulnerability
    - An attacker needs some assistance inside the target's environment in which he gains local access to exploit the vulnerability
        + This is used when the attacker already has the ability to execute code with limited permission and
        + Wishes to enhance his priviledges to gain unrestricted access (Priviledge Escalation)

### Types of Vulnerabilities Based on Software Lifecycle
- Design Vulnerabilities
    + Could take a lot of time to fix
    + Weakness in the software specifications
    + From the defender's point of view, this is the worst type
    - To fix these, changes must be introduced into the security requirements. 
        - However, the subsequent changes to the design and implementation can take considerable time and effort

- Implementation Vulnerabilities
    + Technical security glitches found in the code of a system

- Operational Vulnerabilities
    + Improper connfiguration and deployment of a system in a particular environment

### Vulnerability Taxonomy
- CVE : Common Vulnerability Exposures
    + Each vulnerability is listed as a code
    + [M!TRE CVE](https://cve.mitre.org)
- CWE : Common Weakness Enumeration
    + Common Weaknesses 
    + [M!TRE CWE](https://cwe.mitre.org)
- [OWASP Top 10](https://www.owasp.org/index.php/Category:OWASP_Top_Ten_Project)

## Resources and References

### Common Vulnerability Exposures
- CVE
    + also known as Common Vulnerability Exposures
    + Provides a catalog for publicly known Information Security vulnerabilities and exposures
    + Is supported by US-CERT, US Homeland Security Department and MITRE (A non-profit Organization operating research and development centers sponsered by the U.S. federal government)
   
    - Definitions given in CVE:
        + Vulnerability : the state/hole/issue of being exposed to an attacker who can maliciously gain full access to a network and/or system
        + Exposure : A mistake in software code or configuration that will provide an attacker with indirect access to a network and/or system
    - Purpose of CVE:
        - To standardize the way each known vulnerability and/or exposure is identified so that CVE database is maintained
        - Standard IDs provides security administrators with quick access to technical information about a specific threat across multiple CVE‐compatible information sources
     
- Each entry in the CVE database consists of
    + CVE-ID: The actual CVE identifier, i.e. CVE‐2012‐2234. Note that the general syntax is CVE + Year + Arbitrary Digits
    + Description: Text description of the issue (or placeholder when the issue is under embargo)
    + References: URLs and other information for the issue
    + Date Entry Created: The date the entry was created
    + Phase/Votes/Comments/Proposed The CVE database can be searched by downloading the master copy from http://cve.mitre.org/data/downloads/index.html
    
### Common Weakness Enumeration
- Common Weakness Enumeration (CWE)
    + A formal catalog of software and hardware weakness types
    + Supported by MITRE
- Purpose of CWE
    + To serve as a standard measure for software and hardware security weaknesses in architecture, design and code
    - Benefits for consumers and developers of software:
        + Consumers: They can have assurance that the software they purchased has been reviewed for known types of security flaws.
        + Developer: They can describe their capabilities in terms of the stanard CWEs.
- The CWE List
    + The list is organized following three categories “Research Concepts”, “Development Concepts” and “Architectural Concepts”
    
### OWASP Top 10
- Open Web Application Security Project (OWASP)
    + An online community, produces freely‐available articles, methodologies, documentation, tools, and technologies in the field of web application security
    + The most current OWASP top 10 list was made in 2020: https://owasp.org/www‐project‐tp‐ten/