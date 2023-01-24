## **TETRAMESA IDENTIFIER** 

### **USER GUIDE**

---

*Created by:*

*Clarke van Steenderen*

*Department of Zoology and Entomology*

[*The Centre for Biological Control*] (https://www.ru.ac.za/centreforbiologicalcontrol/)

*Rhodes University, Grahamstown, Eastern Cape, South Africa*

*2022*

*e-mail:* vsteenderen@gmail.com

---

**OVERVIEW**

This program is designed for the quick identification of *Tetramesa* species (Hymenoptera: Eurytomidae), but can be applied to any taxon if the relevant 
database of genetic sequences is supplied.
The user can either upload a database of their choice, or can select 
from those provided under the 'Select File' drop down menu (COI and 28S markers). 
The sequences provided were obtained by Clarke van Steenderen as part of his PhD degree. 
A query nucleotide sequence is entered into the search box, and a phylogenetic tree is created where the query sequence 
is matched to the database, and highlighted in red.
All the sequences in the provided databases will be available on [Genbank](https://www.ncbi.nlm.nih.gov/genbank/) from July 31 2023.

Disclaimer:
The query sequences inputted by the user are not stored by this program, or used in a manner not specified in this document.

---

**PASTING IN A QUERY SEQUENCE**

Insert an optional name into the "Enter sequence name" box. It is set as ">QUERY" by default.

Paste your query nucleotide sequence into the search box, and make sure that it contains only nucleotide bases, and not a name.
For example, if the FASTA sequence is:

**>sequence1A**
 
**AAAAAAGGGGGCCCC**
 
 Then only paste in the **AAAAAAGGGGGCCCC** part.

---

**METHODS**

Agglomeration methods to select from are:

1. complete
2. single
3. UPGMA (unweighted pair group method with arithmetic mean)
4. WPGMA (weighted pair group method with arithmetic mean)
5. NJ (neighbour joining)
6. ML (maximum likelihood)

See the [IdClusters](https://www.rdocumentation.org/packages/DECIPHER/versions/2.0.2/topics/IdClusters) function in the DECIPHER package for more details regarding these methods.

The multiple sequence alignment algorithm uses the R package 'DECIPHER', which can be cited as:

Wright ES (2016). Using DECIPHER v2.0 to Analyze Big Biological Sequence Data in R. *The R Journal*, 8(1), 352-359 

[Link to paper](https://journal.r-project.org/archive/2016/RJ-2016-025/index.html)

---

**EXTRA INFORMATION**

Primers used for obtaining gene sequences:

**COI:**

Forward FWPTF1:
5'-CCTGGTTCTTTRATTGGTAATGATC-3'

Reverse LepR1:
5'-TAAACTTCTGGATGTCCAAAAA-3'


**28S:**

Forward D2F: 
5'-AGTCGTGTTGCTTGATAGTGCAG-3'

Reverse D2R: 
5'-TTGGTCCGTGTTTCAAGACGGG-3'

**References for primers:**

Campbell, B., Heraty, J., Rasplus, J., Chan, K., Steffen-Campbell, J., Babcock, C.,
Austin, A., Dowton, M., 2000. Molecular systematics of the Chalcidoidea using 28S-D2 rDNA, in The Hymenoptera: evolution, biodiversity and biological
control. Austin, A.D, and Dowton, M. (eds).


Hebert, P.D., Penton, E.H., Burns, J.M., Janzen, D.H., Hallwachs, W., 2004. Ten species
in one: DNA barcoding reveals cryptic species in the neotropical skipper butterfly
*Astraptes fulgerator* . Proceedings of the National Academy of Sciences 101, 14812–
14817. doi:10.1073/pnas.0406166101

[Link](https://www.pnas.org/doi/10.1073/pnas.0406166101)

Li, Y., Zhou, X., Feng, G., Hu, H., Niu, L., Hebert, P.D., Huang, D., 2010. COI
and ITS2 sequences delimit species, reveal cryptic taxa and host specificity of fig-
associated Sycophila (Hymenoptera, Eurytomidae). Molecular Ecology Resources 10,
31–40. doi:10.1111/j.1755-0998.2009.02671.x

[Link](https://pubmed.ncbi.nlm.nih.gov/21564988/)

---

**OTHER R PACKAGES USED BY THIS PROGRAM**

[**seqinr**](https://cran.r-project.org/web/packages/seqinr/index.html)

[**dendextend**](https://cran.r-project.org/web/packages/dendextend/index.html)

[**shinyhelper**](https://cran.r-project.org/web/packages/shinyhelper/index.html)

---

**GENBANK ACCESSION NUMBERS**

