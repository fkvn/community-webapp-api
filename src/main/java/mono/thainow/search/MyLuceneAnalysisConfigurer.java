package mono.thainow.search;

import org.apache.lucene.analysis.ngram.EdgeNGramFilterFactory;
import org.hibernate.search.backend.lucene.analysis.LuceneAnalysisConfigurationContext;
import org.hibernate.search.backend.lucene.analysis.LuceneAnalysisConfigurer;
import org.hibernate.search.engine.backend.analysis.AnalyzerNames;

public class MyLuceneAnalysisConfigurer implements LuceneAnalysisConfigurer {
    @Override
    public void configure(LuceneAnalysisConfigurationContext context) {
        context.analyzer(AnalyzerNames.DEFAULT).custom().tokenizer("standard")
                .charFilter("htmlStrip").tokenFilter("lowercase").tokenFilter("snowballPorter")
                .tokenFilter("asciiFolding").tokenFilter(EdgeNGramFilterFactory.class)
                .param("minGramSize", "1").param("maxGramSize", "10");

        context.normalizer("lowercase").custom().tokenFilter("lowercase")
                .tokenFilter("asciiFolding");

        //        context.analyzer("customSearch").custom().tokenizer("whitespace").tokenFilter
        //        ("lowercase")
        //                .tokenFilter("snowballPorter").tokenFilter("asciiFolding");

        //
        //        context.analyzer("keywords-thai").custom().tokenizer("standard").charFilter
        //        ("htmlStrip")
        //                .tokenFilter("lowercase").tokenFilter("snowballPorter").param
        //                ("language", "Thai")
        //                .tokenFilter("asciiFolding");
    }
}