## **DACTYLOPIUS IDENTIFIER** 
[![DOI](https://zenodo.org/badge/237636523.svg)](https://zenodo.org/badge/latestdoi/237636523)

<img src="https://github.com/clarkevansteenderen/DactyID/blob/master/www/logo.png" height = 250>

### **USER GUIDE**

*Created by:*

*Clarke van Steenderen*

*Department of Zoology and Entomology*

[*The Centre for Biological Control*](https://www.ru.ac.za/centreforbiologicalcontrol/)

*Rhodes University, Grahamstown, Eastern Cape, South Africa*

*2019*

*e-mail:* vsteenderen@gmail.com

---

**OVERVIEW**

The R Shiny online application is accessible here:

https://clarkevansteenderen.shinyapps.io/Dactylopius_ID_version_1/?_ga=2.60138989.1168690128.1601562927-2015717805.1599643639

It can also be accessed by typing

`shiny::runGitHub("DactyID", "CJMvS")`

into the R console. Ensure that the R shiny package is installed prior to running this line of code.

This program is designed for the quick identification of *Dactylopius* species (Hemiptera: Dactylopiidae), but can be applied to any taxon if the relevant 
database of genetic sequences is supplied.
The user can either upload a database of their choice, or can select 
from those provided under the 'Select File' drop down menu (12S, 18S, and two COI markers). The sequences provided were obtained by Clarke van Steenderen as part of his M.Sc. 
degree. 
A query nucleotide sequence is entered into the search box, and a phylogenetic tree is created where the query sequence 
is matched to the database, and highlighted in red.
All the sequences in the provided databases will be available on [Genbank] (https://www.ncbi.nlm.nih.gov/genbank/) from July 31 2020.

Disclaimer:
The query sequences inputted by the user are not stored by this program, or used in a manner not specified in this document.

---

**UPLOADING YOUR OWN FILE**

If you wish to upload your own sequences to serve as a database, a FASTA file is required
(.fas extension), containing ***unaligned*** nucleotide sequences.

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

See the [IdClusters] (https://www.rdocumentation.org/packages/DECIPHER/versions/2.0.2/topics/IdClusters) function in the DECIPHER package for more details regarding these methods.

The multiple sequence alignment algorithm uses the R package 'DECIPHER', which can be cited as:

Wright ES (2016). Using DECIPHER v2.0 to Analyze Big Biological Sequence Data in R. *The R Journal*, 8(1), 352-359 

[Link to paper](https://journal.r-project.org/archive/2016/RJ-2016-025/index.html)

---

**EXTRA INFORMATION**

Primers used for obtaining gene sequences:

**12S:**

Forward:
5'-AAGAGTGACGGGCRATTTGTACATA-3'

Reverse:
5'-GTGCCAGCAGTWGCGGTTA-3'

**18S:**

Forward: 
5'-CTGGTTGATCCTGCCAGTAG-3'

Reverse: 
5'-CCGCGGCTGCTGGCACCAGA-3'

**COI:**

Forward (PcoF1): 	
5'-CCTTCAACTAATCATAAAAATATYAG-3'

Reverse (LepR1):	
5'-TAAACTTCTGGATGTCCAAAAAATCA-3'


Forward (DTOMf):	
5'-TCCGRATAGAACTWATAAAYACYAA-3'

Reverse (HCO2198):	
5'-TAAACTTCAGGGTGACCAAAAAATCA-3'


**References for primers:**

Campana,  M.  G.,  Robles  Garcia,  N.  M.,  and  Tuross,  N.,  2015.   America’s  Red  Gold:
Multiple  Lineages  of  Cultivated  Cochineal  in  Mexico. *Ecology  and  Evolution*,  5(3):607–617.  doi  10.1002/ece3.1398

[Link] (https://onlinelibrary.wiley.com/doi/full/10.1002/ece3.1398)

Park, D.S., Suh, S.J., Oh, H.W., and Hebert, P. D. N., 2010. Recovery of the Mitochondrial COI Barcode Region in Diverse 
Hexapoda through tRNA-Based Primers.*BMCGenomics*, 11:7.  doi:  10.1186/1471-2164-11-423

[Link] (https://bmcgenomics.biomedcentral.com/articles/10.1186/1471-2164-11-423)

Ramirez-Puebla, S.T., Rosenblueth, M., Chavez-Moreno, C. K., Catanho Pereira de Lyra,M. C., Tecante, A., and Martinez-Romero, E., 
2010. Molecular Phylogeny of the Genus *Dactylopius* (Hemiptera:  Dactylopiidae) and Identification of the Symbiotic Bacteria.
*Environmental Entomology*, 39(4):1178–1183.  doi:  10.1603/EN10037

[Link] (https://academic.oup.com/ee/article/39/4/1178/447419)

Mathenge, C. W., Riegler, M., Beattie, G. A. C., Spooner-Hart, R. N., & Holford, P. (2015). 
Genetic variation amongst biotypes of *Dactylopius tomentosus*. *Insect Science*, 22(3), 360-374. doi: 10.1111/1744-7917.12120

[Link](https://www.ncbi.nlm.nih.gov/pubmed/24619863) 

---

**OTHER R PACKAGES USED BY THIS PROGRAM**

[**seqinr**](https://cran.r-project.org/web/packages/seqinr/index.html)

[**dendextend**](https://cran.r-project.org/web/packages/dendextend/index.html)

[**shinyhelper**] (https://cran.r-project.org/web/packages/shinyhelper/index.html)

---

**GENBANK ACCESSION NUMBERS**

12S: MN219994 - MN220135

18S: MN310037 - MN310179

PCOF1 and LepR1: MN372226 - MN372280

DTOMf and HCO2198: MN372281 - MN372299

Note Genbank ID [GQ853358.1] (https://www.ncbi.nlm.nih.gov/nuccore/GQ853358.1) and [GQ853350.1](https://www.ncbi.nlm.nih.gov/nuccore/GQ853350.1) (reported to be *D. confusus* by Ramirez-Puebla *et. al.* 2015) 
and Genbank ID [GQ853357.1] (https://www.ncbi.nlm.nih.gov/nuccore/GQ853357.1) and [GQ853349.1](https://www.ncbi.nlm.nih.gov/nuccore/GQ853349.1) (reported to be *D. ceylonicus* by Ramirez-Puebla *et. al.* 2015) both appeared in the *D. opuntiae* clade according to the databases in this program. Both specimens were recorded to have been collected
from *Opuntia ficus-indica*, and are likely misidentifications.

---

**List of sequences**

---

**Abbreviations**

aus. = *Dactylopius austrinus*
cey. = *Dactylopius ceylonicus*

confert. = *Dactylopius confertus* 

confus. = *Dactylopius confusus* 

opunt.f.i. = *Dactylopius opuntiae* 'ficus' lineage

opunt.str. = *Dactylopius opuntiae* 'stricta' lineage

toment.big. = *Dactylopius tomentosus* 'bigelovii' lineage

toment.cal. = *Dactylopius tomentosus* 'californica' lineage

toment.chol. = *Dactylopius tomentosus* 'cholla' lineage

toment.cyl. = *Dactylopius tomentosus* 'cylindropuntia' lineage

toment.ech. = *Dactylopius tomentosus* 'echinocarpa x acanthocarpa' lineage

toment.i. = *Dactylopius tomentosus* 'imbricata' lineage

---


**12S**

opunt.f.i.MN219994

opunt.f.i.MN219995

opunt.f.i.MN219996

opunt.f.i.MN219997

opunt.f.i.MN219998

opunt.f.i.MN219999

toment.i.MN220000

toment.i.MN220001

toment.i.MN220002

toment.chol.MN220003

toment.chol.MN220004

opunt.MN220005

opunt.f.i.MN220006

opunt.f.i.MN220007

opunt.f.i.MN220008

opunt.MN220009

cey.MN220010

cey.MN220011

aus.MN220012

aus.MN220013

aus.MN220014

confus.MN220015

confus.MN220016

confus.MN220017

confus.MN220018

confus.MN220019

opunt.flag.MN220020

opunt.flag.MN220021

opunt.flag.MN220022

opunt.tuc.MN220023

opunt.tuc.MN220024

opunt.tuc.MN220025

opunt.sed.MN220026

opunt.sed.MN220027

opunt.sed.MN220028

confus.4PM.MN220029

confus.4PM.MN220030

confus.4PM.MN220031

confus.LC.MN220032

confus.LC.MN220033

confus.LC.MN220034

opunt.f.i.MN220035

opunt.f.i.MN220036

cey.MN220037

aus.MN220038

cey.MN220039

toment.chol.MN220040

toment.i.MN220041

toment.i.MN220042

opunt.MN220043

opunt.MN220044

opunt.MN220045

opunt.MN220046

opunt.MN220047

opunt.MN220048

opunt.MN220049

opunt.MN220050

opunt.MN220051

opunt.MN220052

opunt.MN220053

confus.MN220054

confus.MN220055

confus.MN220056

opunt.MN220057

opunt.MN220058

confus.MN220059

confus.MN220060

opunt.MN220061

opunt.MN220062

confus.MN220063

confus.MN220064

opunt.MN220065

opunt.MN220066

opunt.MN220067

toment.chol.MN220068

toment.chol.MN220069

toment.cal.MN220070

toment.cal.MN220071

toment.cal.MN220072

toment.cal.MN220073

opunt.MN220074

opunt.MN220075

opunt.MN220076

opunt.str.MN220077

opunt.str.MN220078

aus.MN220079

opunt.str.MN220080

opunt.str.MN220081

opunt.MN220082

opunt.str.MN220083

opunt.str.MN220084

opunt.str.MN220085

opunt.str.MN220086

opunt.str.MN220087

opunt.str.MN220088

opunt.str.MN220089

opunt.str.MN220090

aus.MN220091

opunt.str.MN220092

opunt.str.MN220093

opunt.str.MN220094

opunt.str.MN220095

opunt.str.MN220096

opunt.str.MN220097

opunt.str.MN220098

opunt.str.MN220099

opunt.str.MN220100

opunt.str.MN220101

toment.i.MN220102

toment.i.MN220103

toment.i.MN220104

toment.i.MN220105

opunt.str.MN220106

opunt.str.MN220107

opunt.MN220108

toment.chol.MN220109

toment.chol.MN220110

opunt.MN220111

toment.chol.MN220112

toment.ech.MN220113

toment.ech.MN220114

toment.ech.MN220115

toment.cyl.MN220116

toment.cyl.MN220117

toment.ech.MN220118

toment.chol.MN220119

toment.chol.MN220120

toment.chol.MN220121

cey.MN220122

cey.MN220123

cey.MN220124

toment.cal.MN220125

toment.cal.MN220126

toment.cal.MN220127

toment.cal.MN220128

toment.big.MN220129

aus.MN220130

aus.MN220131

aus.MN220132

opunt.str.MN220133

opunt.str.MN220134

opunt.str.MN220135

opunt.GQ853353.1 

opunt.GQ853352.1 

opunt.GQ853351.1 

coccus.KJ701988.1

coccus.KJ701987.1 

coccus.KJ701986.1 

coccus.KJ701968.1 

P.nigra.HQ893819.1 

C.sinensis.HQ893810.1  

C.viridis.HQ893818.1 

I.purchasi.HQ893806.1 

---

**18S**

confert.MN310037

confert.MN310038

opunt.MN310039

opunt.f.i.MN310040

opunt.MN310041

opunt.MN310042

opunt.MN310043

opunt.MN310044

opunt.MN310045

opunt.MN310046

opunt.MN310047

opunt.MN310048

opunt.MN310049

opunt.MN310050

opunt.MN310051

opunt.MN310052

opunt.MN310053

confus.MN310054

confus.MN310055

confus.MN310056

confus.MN310057

opunt.MN310058

opunt.MN310059

confus.MN310060

confus.MN310061

confus.MN310062

confus.MN310063

opunt.MN310064

aus.MN310065

opunt.MN310066

toment.chol.MN310067

toment.chol.MN310068

aus.MN310069

cey.MN310070

opunt.MN310071

toment.chol.MN310072

aus.MN310073

cey.MN310074

opunt.MN310075

toment.i.MN310076

toment.i.MN310077

opunti.f.i.MN310078

opunti.f.i.MN310079

opunti.f.i.MN310080

cey.MN310081

opunt.flag.MN310082

opunt.flag.MN310083

opunt.flag.MN310084

opunt.tuc.MN310085

opunt.tuc.MN310086

opunt.tuc.MN310087

opunt.sed.MN310088

opunt.sed.MN310089

opunt.sed.MN310090

confus.4pm.MN310091

confus.lc.MN310092

confus.lc.MN310093

confus.lc.MN310094

opunt.f.i.MN310095

opunt.f.i.MN310096

opunt.MN310097

opunt.MN310098

confus.MN310099

confus.MN310100

confus.MN310101

confus.MN310102

confus.MN310103

coccus.KJ7019951 

coccus.KJ7019941 

coccus.KJ7019931 

coccus.KJ7019921 

coccus.KJ7019911 

opunt.MN310104

opunt.MN310105

opunt.MN310106

opunt.MN310107

toment.cal.MN310108

toment.cal.MN310109

toment.cal.MN310110

toment.cal.MN310111

toment.cal.MN310112

toment.chol.MN310113

toment.chol.MN310114

opunt.MN310115

opunt.MN310116

opunt.str.MN310117

opunt.str.MN310118

opunt.str.MN310119

opunt.str.MN310120

opunt.str.MN310121

opunt.str.MN310122

opunt.str.MN310123

opunt.str.MN310124

opunt.str.MN310125

opunt.str.MN310126

opunt.str.MN310127

opunt.str.MN310128

opunt.str.MN310129

aus.MN310130

aus.MN310131

aus.MN310132

cey.MN310133

cey.MN310134

toment.chol.MN310135

toment.i.MN310136

toment.i.MN310137

toment.i.MN310138

opunt.MN310139

opunt.MN310140

opunt.MN310141

opunt.f.i.MN310142

opunt.str.MN310143

opunt.str.MN310144

opunt.str.MN310145

toment.ech.MN310146

opunt.MN310147

toment.i.MN310148

aus.MN310149

toment.big.MN310150

toment.cal.MN310151

cey.MN310152

toment.chol.MN310153

toment.cyl.MN310154

opunt.MN310155

toment.i.MN310156

toment.cyl.MN310157

toment.cal.MN310158

toment.big.MN310159

cey.MN310160

toment.chol.MN310161

opunt.MN310162

opunt.MN310163

toment.i.MN310164

toment.i.MN310165

opunt.MN310166

opunt.MN310167

toment.ech.MN310168

toment.ech.MN310169

toment.cyl.MN310170

toment.cyl.MN310171

toment.chol.MN310172

cey.MN310173

cey.MN310174

toment.cal.MN310175

toment.cal.MN310176

toment.big.MN310177

aus.MN310178

aus.MN310179

opunt.GQ853363.1

toment.GQ853360.1

confus.KT199039.1 

aus.AY795538.1 

confus.U20402.1

P.nigra.KY9276001 

C.sinensis.HQ8937881

I.purchasi.KT199034.1 

C.viridis.HQ8937931 

---

**COI: PCOF1 and LepR1**

confert.MN372226

confert.MN372227

opunt.MN372228

opunt.

opunt.MN372229

opunt.MN372230

opunt.MN372231

opunt.MN372232

opunt.MN372233

opunt.MN372234

opunt.MN372235

opunt.MN372236

opunt.MN372237

confus.MN372238

opunt.

confus.MN372239

confus.MN372240

confus.MN372241

confus.MN372242

confus.MN372243

opunt.MN372244

opunt.MN372245

confus.MN372246

confus.MN372247

confus.MN372248

confus.MN372249

opunt.MN372250

opunt.

toment.chol.MN372251

opunt.MN372252

opunt.f.i.MN372253

toment.i.MN372254

opunt.f.i.

opunt.f.i.MN372255

opunt.f.i.MN372256

opunt.flag.MN372257

opunt.flag.MN372258

opunt.flag.

opunt.tuc.MN372259

opunt.tuc.MN372260

opunt.sed.MN372261

opunt.sed. 

opunt.sed.MN372262

confus.4PM.MN372263

confus.4PM.MN372264

confus.4PM.MN372265

confus.lc.MN372266

confus.lc.MN372267

confus.lc.MN372268

opunt.f.i.MN372269

opunt.f.i.MN372270

opunt.f.i.MN372271

opunt.MN372272

opunt.MN372273

confus.MN372274

confus.PCOF1

C.viridis.GU936953.1 

I.purchasi.KP692469.1 

opunt.str.MN372275

opunt.str.MN372276

opunt.str.MN372277

opunt.str.MN372278

opunt.str.MN372279

opunt.str.MN372280

---

**COI: DTOMf and HCO2198**

opunt.eng3

toment.ech.MN372281

toment.ech.MN372282

toment.ech.MN372283

toment.ech.MN372284

toment.cyl.MN372285

toment.cyl.MN372286

toment.chol.MN372287

toment.chol.MN372288

toment.chol.MN372289

toment.chol.MN372290

toment.cal.MN372291

toment.cal.MN372292

toment.cal.MN372293

toment.cal.MN372294

toment.big.MN372295

toment.big.MN372296

toment.big.MN372297

toment.big.

toment.chol.MN372298

toment.i.MN372299

toment.i.GU228788.1 

toment.i.GU228787.1 

toment.roseaP.GU228786.1 

toment.cholDH.GU228781.1 

toment.cholE.GU228780.1

toment.cholD.GU228779.1 

toment.RoseaY.GU228785.1 

toment.fulg.GU228784.1  

toment.mamill.GU228783.1 

toment.mol.GU228782.1 

opunt.GU228789.1 

