import tables
import strutils
import sequtils

proc detectAnagrams*(word: string, candidates: openArray[string]): seq[string]=
    let word_lower = word.toLowerAscii
    let word_ct = toSeq(word_lower.items).toCountTable
    
    for candidate in candidates:
        let candidate_lower = candidate.toLowerAscii
        
        if candidate_lower == word_lower:
            continue

        let candidate_ct = toSeq(candidate_lower.items).toCountTable
        if word_ct == candidate_ct:
            result.add(candidate)