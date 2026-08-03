{% include stu-note.xml %}

### Myra Jones: Complete Example

One patient — Myra Jones — provides the canonical example content for this guide, demonstrating both the document profiles and the element maps from a single consistent source.

**The C-CDA document (source):**

* [Myra Jones CCD (XML download)](myra-jones-ccd.xml) — the master Continuity of Care Document. Every CDA fragment shown on the mapping pages is extracted from this file at build time.

**The FHIR document (mapped result):**

* [Composition](Composition-Composition-CCD-Myra.html) — mapped from the CCD header ([see the header map](CF-header.html)), conforming to the [Continuity of Care Document profile](StructureDefinition-Continuity-of-Care-Document.html); its sections reference the standalone mapped resources shown on the element-map pages.
* [Document Bundle](Bundle-Bundle-CCD-Myra.html) — the complete FHIR document: the Composition plus every referenced resource, conforming to the FHIR Clinical Documents bundle profile. The entries are build-time copies of the standalone example instances, so the bundle cannot drift from the per-domain examples.

**The document at a glance:**

<figure>
<img src="myra-bundle-graph.svg" alt="Resource reference graph of the Myra Jones FHIR document bundle" style="width:100%; max-width:1500px;"/>
<figcaption>The Myra Jones document Bundle: the Composition, its section boundaries (dashed) and section entries (gray arrows), and every inter-resource reference (labeled arrows). Regenerated from the Bundle by <code>scripts/gen-bundle-graph.py</code>.</figcaption>
</figure>

**How it stays consistent:** the CDA fragments, the highlighted mapping examples, the standalone FHIR instances, and this document Bundle are all generated or verified from the same two sources (the master CCD and the FHIR instance definitions) on every build. A value changed in one place either propagates everywhere or fails the build.
