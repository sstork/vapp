Flat profile:

Each sample counts as 0.01 seconds.
  %   cumulative   self              self     total           
 time   seconds   seconds    calls  ms/call  ms/call  name    
 43.44      0.43     0.43  4047013     0.00     0.00  sqlite3VXPrintf
 12.12      0.55     0.12   809419     0.00     0.00  sqlite3VdbeExec
  6.06      0.61     0.06   758517     0.00     0.00  Profiler::addToRead(long, long, long, long)
  3.03      0.64     0.03  5665887     0.00     0.00  sqlite3ApiExit
  3.03      0.67     0.03  4047031     0.00     0.00  sqlite3ValueText
  3.03      0.70     0.03  4047017     0.00     0.00  sqlite3StrAccumAppend
  3.03      0.73     0.03   809305     0.00     0.00  Profiler::addToUsage(long, long)
  2.53      0.76     0.03  4047023     0.00     0.00  sqlite3VdbeSerialGet
  2.02      0.78     0.02  4047031     0.00     0.00  sqlite3VdbeChangeEncoding
  2.02      0.80     0.02  4047023     0.00     0.00  columnMem
  2.02      0.82     0.02  4047012     0.00     0.00  sqlite3_snprintf
  2.02      0.84     0.02   809401     0.00     0.00  callback(void*, int, char**, char**)
  1.52      0.85     0.02  4047059     0.00     0.00  sqlite3DbMallocSize
  1.01      0.86     0.01  4047041     0.00     0.00  sqlite3VdbeMemGrow
  1.01      0.87     0.01  4047023     0.00     0.00  columnMallocFailure
  1.01      0.88     0.01  4047013     0.00     0.00  sqlite3StrAccumFinish
  1.01      0.89     0.01  4047011     0.00     0.00  sqlite3VdbeMemStringify
  1.01      0.90     0.01   812052     0.00     0.00  Cache::getTag(long)
  1.01      0.91     0.01   809400     0.00     0.00  AssociativeCache::access(long, int, bool)
  1.01      0.92     0.01   809400     0.00     0.00  AssociativeCache::getIndex(long)
  1.01      0.93     0.01   519204     0.00     0.00  advanceTSC(long)
  1.01      0.94     0.01   239123     0.00     0.00  Part::memRead(long, long, int)
  1.01      0.95     0.01    86298     0.00     0.00  sqlite3MemSize
  1.01      0.96     0.01                             pthreadMutexTry
  0.51      0.97     0.01  4964252     0.00     0.00  sqlite3_mutex_enter
  0.51      0.97     0.01  4047023     0.00     0.00  sqlite3VdbeMemStoreType
  0.51      0.98     0.01    21657     0.00     0.00  sqlite3Malloc
  0.51      0.98     0.01        2     2.50     2.50  sqlite3_mutex_free
  0.51      0.99     0.01                             dup8bytes
  0.51      0.99     0.01                             sqlite3_stmt_status
  0.00      0.99     0.00  4964252     0.00     0.00  pthreadMutexEnter
  0.00      0.99     0.00  4964252     0.00     0.00  pthreadMutexLeave
  0.00      0.99     0.00  4964252     0.00     0.00  sqlite3_mutex_leave
  0.00      0.99     0.00  4856431     0.00     0.00  sqlite3VdbeMemReleaseExternal
  0.00      0.99     0.00  4047043     0.00     0.00  sqlite3VdbeMemNulTerminate
  0.00      0.99     0.00  4047031     0.00     0.00  sqlite3_value_text
  0.00      0.99     0.00  4047023     0.00     0.00  sqlite3VdbeCursorMoveto
  0.00      0.99     0.00  4047023     0.00     0.00  sqlite3VdbeMemMakeWriteable
  0.00      0.99     0.00  4047023     0.00     0.00  sqlite3_column_text
  0.00      0.99     0.00   831346     0.00     0.00  sqlite3_free
  0.00      0.99     0.00   809865     0.00     0.00  sqlite3DbFree
  0.00      0.99     0.00   809431     0.00     0.00  sqlite3BtreeMutexArrayLeave
  0.00      0.99     0.00   809431     0.00     0.00  sqlite3VdbeCheckFk
  0.00      0.99     0.00   809419     0.00     0.00  sqlite3_step
  0.00      0.99     0.00   809408     0.00     0.00  sqlite3VdbeMemRelease
  0.00      0.99     0.00   809407     0.00     0.00  btreeParseCell
  0.00      0.99     0.00   809407     0.00     0.00  btreeParseCellPtr
  0.00      0.99     0.00   809407     0.00     0.00  sqlite3BtreeNext
  0.00      0.99     0.00   809407     0.00     0.00  sqlite3GetVarint
  0.00      0.99     0.00   809407     0.00     0.00  sqlite3VdbeCloseStatement
  0.00      0.99     0.00   809400     0.00     0.00  RDTSC()
  0.00      0.99     0.00   758517     0.00     0.00  AssociativeCache::read(long, int)
  0.00      0.99     0.00   229103     0.00     0.00  Part::instruction(long)
  0.00      0.99     0.00    86254     0.00     0.00  sqlite3MallocSize
  0.00      0.99     0.00    50883     0.00     0.00  AssociativeCache::write(long, int)
  0.00      0.99     0.00    50883     0.00     0.00  Part::memWrite(long, long, int)
  0.00      0.99     0.00    50883     0.00     0.00  Profiler::addToWrite(long, long, long, long)
  0.00      0.99     0.00    21658     0.00     0.00  sqlite3MemRoundup
  0.00      0.99     0.00    21657     0.00     0.00  mallocWithAlarm
  0.00      0.99     0.00    21657     0.00     0.00  sqlite3MemFree
  0.00      0.99     0.00    21657     0.00     0.00  sqlite3MemMalloc
  0.00      0.99     0.00    21472     0.00     0.00  sqlite3PagerPagecount
  0.00      0.99     0.00    21471     0.00     0.00  pcache1Free
  0.00      0.99     0.00    21470     0.00     0.00  btreeGetPage
  0.00      0.99     0.00    21470     0.00     0.00  pcache1Fetch
  0.00      0.99     0.00    21470     0.00     0.00  pcache1PinPage
  0.00      0.99     0.00    21470     0.00     0.00  releasePage
  0.00      0.99     0.00    21470     0.00     0.00  sqlite3OsRead
  0.00      0.99     0.00    21470     0.00     0.00  sqlite3PagerAcquire
  0.00      0.99     0.00    21470     0.00     0.00  sqlite3PagerUnref
  0.00      0.99     0.00    21470     0.00     0.00  sqlite3PcacheFetch
  0.00      0.99     0.00    21470     0.00     0.00  sqlite3PcacheRelease
  0.00      0.99     0.00    21470     0.00     0.00  unixRead
  0.00      0.99     0.00    21469     0.00     0.00  pcache1Alloc
  0.00      0.99     0.00    21469     0.00     0.00  pcache1Unpin
  0.00      0.99     0.00    21468     0.00     0.00  btreeInitPage
  0.00      0.99     0.00    21468     0.00     0.00  getAndInitPage
  0.00      0.99     0.00    21468     0.00     0.00  pcache1FreePage
  0.00      0.99     0.00    21466     0.00     0.00  moveToChild
  0.00      0.99     0.00    21251     0.00     0.00  moveToLeftmost
  0.00      0.99     0.00    11638     0.00     0.00  std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_unique_(std::_Rb_tree_const_iterator<std::pair<long const, Entry*> >, std::pair<long const, Entry*> const&)
  0.00      0.99     0.00     8268     0.00     0.00  std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_(std::_Rb_tree_node_base const*, std::_Rb_tree_node_base const*, std::pair<long const, Entry*> const&)
  0.00      0.99     0.00      710     0.00     0.00  yy_find_shift_action
  0.00      0.99     0.00      278     0.00     0.00  yy_shift
  0.00      0.99     0.00      262     0.00     0.00  sqlite3GetToken
  0.00      0.99     0.00      201     0.00     0.00  sqlite3DbMallocRaw
  0.00      0.99     0.00      185     0.00     0.00  sqlite3Parser
  0.00      0.99     0.00      110     0.00     0.00  keywordCode
  0.00      0.99     0.00       95     0.00     0.00  Part::memRead(long, long, long, int)
  0.00      0.99     0.00       90     0.00     0.00  sqlite3ExprDelete
  0.00      0.99     0.00       86     0.00     0.00  sqlite3DbStrNDup
  0.00      0.99     0.00       76     0.00     0.00  sqlite3NameFromToken
  0.00      0.99     0.00       75     0.00     0.00  sqlite3Dequote
  0.00      0.99     0.00       62     0.00     0.00  sqlite3DbMallocZero
  0.00      0.99     0.00       61     0.00     0.00  sqlite3FuncDefInsert
  0.00      0.99     0.00       60     0.00     0.00  sqlite3VdbeMemSetStr
  0.00      0.99     0.00       57     0.00     0.00  freeP4
  0.00      0.99     0.00       51     0.00     0.00  sqlite3VdbeAddOp3
  0.00      0.99     0.00       50     0.00     0.00  releaseMemArray
  0.00      0.99     0.00       49     0.00     0.00  sqlite3BtreeEnter
  0.00      0.99     0.00       49     0.00     0.00  sqlite3BtreeLeave
  0.00      0.99     0.00       44     0.00     0.00  sqlite3Error
  0.00      0.99     0.00       44     0.00     0.00  sqlite3VdbeMemSetNull
  0.00      0.99     0.00       42     0.00     0.00  sqlite3HashFind
  0.00      0.99     0.00       42     0.00     0.00  sqlite3WalkExpr
  0.00      0.99     0.00       30     0.00     0.00  pthreadMutexAlloc
  0.00      0.99     0.00       29     0.00     0.00  sqlite3AffinityType
  0.00      0.99     0.00       29     0.00     0.00  sqlite3MutexAlloc
  0.00      0.99     0.00       28     0.00     0.01  sqlite3DbRealloc
  0.00      0.99     0.00       28     0.00     0.00  sqlite3WalkExprList
  0.00      0.99     0.00       24     0.00     0.00  sqlite3VdbeHalt
  0.00      0.99     0.00       22     0.00     0.00  sqlite3DeleteTable
  0.00      0.99     0.00       22     0.00     0.00  sqlite3VdbeAddOp0
  0.00      0.99     0.00       21     0.00     0.12  sqlite3_initialize
  0.00      0.99     0.00       20     0.00     0.00  sqlite3AuthCheck
  0.00      0.99     0.00       20     0.00     0.00  sqlite3GetVdbe
  0.00      0.99     0.00       18     0.00     0.00  sqlite3HashClear
  0.00      0.99     0.00       17     0.00     0.00  sqlite3BitvecDestroy
  0.00      0.99     0.00       16     0.00     0.00  exprWalkNoop
  0.00      0.99     0.00       16     0.00     0.00  sqlite3ExprListDelete
  0.00      0.99     0.00       16     0.00     0.00  sqlite3ResolveExprNames
  0.00      0.99     0.00       16     0.00     0.00  sqlite3VdbeSetColName
  0.00      0.99     0.00       15     0.00     0.00  sqlite3VdbeAddOp2
  0.00      0.99     0.00       14     0.00     0.00  btreeEndTransaction
  0.00      0.99     0.00       14     0.00     0.00  sqlite3BtreeEnterAll
  0.00      0.99     0.00       14     0.00     0.00  sqlite3BtreeLeaveAll
  0.00      0.99     0.00       14     0.00     0.00  sqlite3SelectDelete
  0.00      0.99     0.00       13     0.00     0.00  callFinaliser
  0.00      0.99     0.00       13     0.00     0.00  sqlite3BtreeCommitPhaseOne
  0.00      0.99     0.00       13     0.00     0.00  sqlite3BtreeCommitPhaseTwo
  0.00      0.99     0.00       13     0.00     0.00  sqlite3FindTable
  0.00      0.99     0.00       13     0.00     0.00  sqlite3_malloc
  0.00      0.99     0.00       12     0.00     0.01  growOpArray
  0.00      0.99     0.00       12     0.00     0.00  resolveP2Values
  0.00      0.99     0.00       12     0.00     0.00  sqlite3DeleteTrigger
  0.00      0.99     0.00       12     0.00     0.00  sqlite3FindCollSeq
  0.00      0.99     0.00       12     0.00     0.00  sqlite3LockAndPrepare
  0.00      0.99     0.00       12     0.00     0.00  sqlite3Prepare
  0.00      0.99     0.00       12     0.00     0.00  sqlite3ReadSchema
  0.00      0.99     0.00       12     0.00     0.00  sqlite3RunParser
  0.00      0.99     0.00       12     0.00     0.00  sqlite3VdbeCreate
  0.00      0.99     0.00       12     0.00     0.00  sqlite3VdbeDelete
  0.00      0.99     0.00       12     0.00     0.00  sqlite3VdbeFinalize
  0.00      0.99     0.00       12     0.00     0.00  sqlite3VdbeMakeReady
  0.00      0.99     0.00       12     0.00     0.00  sqlite3VdbeReset
  0.00      0.99     0.00       12     0.00    80.33  sqlite3_exec
  0.00      0.99     0.00       12     0.00     0.00  sqlite3_prepare
  0.00      0.99     0.00       12     0.00     0.00  vdbeFreeOpArray
  0.00      0.99     0.00       12     0.00     0.00  yy_destructor
  0.00      0.99     0.00       11     0.00     0.00  sqlite3HashInsert
  0.00      0.99     0.00       10     0.00     0.00  sqlite3TwoPartName
  0.00      0.99     0.00        9     0.00     0.00  sqlite3BeginBenignMalloc
  0.00      0.99     0.00        9     0.00     0.00  sqlite3EndBenignMalloc
  0.00      0.99     0.00        9     0.00     0.00  sqlite3ExprAlloc
  0.00      0.99     0.00        9     0.00     0.00  sqlite3ExprClear
  0.00      0.99     0.00        9     0.00     0.00  sqlite3ExprListAppend
  0.00      0.99     0.00        9     0.00     0.00  sqlite3FindFunction
  0.00      0.99     0.00        8     0.00     0.00  columnName
  0.00      0.99     0.00        8     0.00     0.00  columnType
  0.00      0.99     0.00        8     0.00     0.00  lookupName
  0.00      0.99     0.00        8     0.00     0.00  resolveExprStep
  0.00      0.99     0.00        8     0.00     0.00  sqlite3CheckObjectName
  0.00      0.99     0.00        8     0.00     0.00  sqlite3ColumnDefault
  0.00      0.99     0.00        8     0.00     0.00  sqlite3EndTable
  0.00      0.99     0.00        8     0.00     0.00  sqlite3ExprCacheStore
  0.00      0.99     0.00        8     0.00     0.00  sqlite3ExprCode
  0.00      0.99     0.00        8     0.00     0.00  sqlite3ExprCodeGetColumn
  0.00      0.99     0.00        8     0.00     0.00  sqlite3ExprCodeTarget
  0.00      0.99     0.00        8     0.00     0.00  sqlite3FindIndex
  0.00      0.99     0.00        8     0.00     0.00  sqlite3InitCallback
  0.00      0.99     0.00        8     0.00     0.00  sqlite3MallocZero
  0.00      0.99     0.00        8     0.00     0.00  sqlite3StartTable
  0.00      0.99     0.00        8     0.00     0.00  sqlite3ValueFromExpr
  0.00      0.99     0.00        8     0.00     0.00  sqlite3VdbeMakeLabel
  0.00      0.99     0.00        8     0.00     0.00  sqlite3_column_name
  0.00      0.99     0.00        8     0.00     0.00  sqliteResetColumnNames
  0.00      0.99     0.00        7     0.00     0.00  pthreadMutexInit
  0.00      0.99     0.00        7     0.00     0.00  sqlite3OsClose
  0.00      0.99     0.00        7     0.00     0.00  unixEnterMutex
  0.00      0.99     0.00        7     0.00     0.00  unixLeaveMutex
  0.00      0.99     0.00        6     0.00     0.00  Profiler::getTotalStallCycles()
  0.00      0.99     0.00        6     0.00     0.00  sqlite3BtreeGetMeta
  0.00      0.99     0.00        6     0.00     0.00  sqlite3Expr
  0.00      0.99     0.00        6     0.00     0.00  sqlite3ExprCacheClear
  0.00      0.99     0.00        6     0.00     0.00  sqlite3VdbeChangeP4
  0.00      0.99     0.00        6     0.00     0.00  sqlite3WalkSelect
  0.00      0.99     0.00        5     0.00     0.00  createCollation
  0.00      0.99     0.00        5     0.00     0.00  sqlite3ExprListSetName
  0.00      0.99     0.00        5     0.00     0.00  sqlite3GetVarint32
  0.00      0.99     0.00        4     0.00     0.00  findTerm
  0.00      0.99     0.00        4     0.00     0.00  pcache1EnforceMaxPage
  0.00      0.99     0.00        4     0.00     0.00  sqlite3CodeVerifySchema
  0.00      0.99     0.00        4     0.00     0.00  sqlite3CreateFunc
  0.00      0.99     0.00        4     0.00     0.01  sqlite3DbReallocOrFree
  0.00      0.99     0.00        4     0.00     0.00  sqlite3SchemaFree
  0.00      0.99     0.00        4     0.00     0.00  sqlite3_vfs_register
  0.00      0.99     0.00        4     0.00     0.00  unixUnlock
  0.00      0.99     0.00        3     0.00     0.00  exprSetHeight
  0.00      0.99     0.00        3     0.00     0.00  pagerUnlockAndRollback
  0.00      0.99     0.00        3     0.00     0.00  pager_unlock
  0.00      0.99     0.00        3     0.00     0.00  pcache1Cachesize
  0.00      0.99     0.00        3     0.00     0.00  releaseAllSavepoints
  0.00      0.99     0.00        3     0.00     0.00  sqlite3BtreeBeginTrans
  0.00      0.99     0.00        3     0.00     0.00  sqlite3BtreeSetCacheSize
  0.00      0.99     0.00        3     0.00     0.00  sqlite3ExprAttachSubtrees
  0.00      0.99     0.00        3     0.00     0.00  sqlite3Init
  0.00      0.99     0.00        3     0.00     0.00  sqlite3PExpr
  0.00      0.99     0.00        3     0.00     0.00  sqlite3PageFree
  0.00      0.99     0.00        2     0.00     0.00  AssociativeCache::AssociativeCache(int, int, int, int, int, int)
  0.00      0.99     0.00        2     0.00     0.00  Cache::doReport(std::ostream&)
  0.00      0.99     0.00        2     0.00     0.00  Cache::Cache(int, int, int, int, int, int)
  0.00      0.99     0.00        2     0.00     0.00  Profiler::reportEntires(std::ostream&, std::list<Entry*, std::allocator<Entry*> >&, long, long, long, long)
  0.00      0.99     0.00        2     0.00     0.00  Profiler::doReport(std::ostream&)
  0.00      0.99     0.00        2     0.00     0.00  std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_unique(std::pair<long const, Entry*> const&)
  0.00      0.99     0.00        2     0.00     0.00  allocateCursor
  0.00      0.99     0.00        2     0.00     0.00  bestBtreeIndex
  0.00      0.99     0.00        2     0.00     0.00  bestOrClauseIndex
  0.00      0.99     0.00        2     0.00     0.00  clearSelect
  0.00      0.99     0.00        2     0.00     0.00  codeOffset
  0.00      0.99     0.00        2     0.00     0.00  computeLimitRegisters
  0.00      0.99     0.00        2     0.00     0.00  generateColumnNames
  0.00      0.99     0.00        2     0.00     0.00  moveToRoot
  0.00      0.99     0.00        2     0.00     0.64  pager_reset
  0.00      0.99     0.00        2     0.00     0.00  pager_wait_on_lock
  0.00      0.99     0.00        2     0.00     1.28  pcache1TruncateUnsafe
  0.00      0.99     0.00        2     0.00     0.00  pthreadMutexFree
  0.00      0.99     0.00        2     0.00     0.00  rangeLock
  0.00      0.99     0.00        2     0.00     0.00  resolveOrderGroupBy
  0.00      0.99     0.00        2     0.00     0.00  resolveSelectStep
  0.00      0.99     0.00        2     0.00     0.00  selectAddSubqueryTypeInfo
  0.00      0.99     0.00        2     0.00     0.01  selectExpander
  0.00      0.99     0.00        2     0.00     0.01  selectInnerLoop
  0.00      0.99     0.00        2     0.00     0.00  setSectorSize
  0.00      0.99     0.00        2     0.00     0.00  sqlite3BtreeCloseCursor
  0.00      0.99     0.00        2     0.00     0.00  sqlite3BtreeCursor
  0.00      0.99     0.00        2     0.00     0.00  sqlite3BtreeFirst
  0.00      0.99     0.00        2     0.00     0.00  sqlite3BtreeSchema
  0.00      0.99     0.00        2     0.00     0.01  sqlite3ExprCodeExprList
  0.00      0.99     0.00        2     0.00     0.00  sqlite3IdListDelete
  0.00      0.99     0.00        2     0.00     0.00  sqlite3IndexedByLookup
  0.00      0.99     0.00        2     0.00     0.00  sqlite3InitOne
  0.00      0.99     0.00        2     0.00     0.00  sqlite3LocateTable
  0.00      0.99     0.00        2     0.00     0.01  sqlite3OpenTable
  0.00      0.99     0.00        2     0.00     0.00  sqlite3OsAccess
  0.00      0.99     0.00        2     0.00     0.00  sqlite3OsFileSize
  0.00      0.99     0.00        2     0.00     0.32  sqlite3PagerSetPagesize
  0.00      0.99     0.00        2     0.00     0.00  sqlite3PcacheTruncate
  0.00      0.99     0.00        2     0.00     0.00  sqlite3Pragma
  0.00      0.99     0.00        2     0.00     0.00  sqlite3ResetInternalSchema
  0.00      0.99     0.00        2     0.00     0.00  sqlite3SchemaGet
  0.00      0.99     0.00        2     0.00     0.03  sqlite3Select
  0.00      0.99     0.00        2     0.00     0.00  sqlite3SelectNew
  0.00      0.99     0.00        2     0.00     0.00  sqlite3SelectPrep
  0.00      0.99     0.00        2     0.00     0.00  sqlite3SrcListAppend
  0.00      0.99     0.00        2     0.00     0.00  sqlite3SrcListAppendFromTerm
  0.00      0.99     0.00        2     0.00     0.00  sqlite3SrcListAssignCursors
  0.00      0.99     0.00        2     0.00     0.00  sqlite3SrcListDelete
  0.00      0.99     0.00        2     0.00     0.00  sqlite3SrcListEnlarge
  0.00      0.99     0.00        2     0.00     0.00  sqlite3SrcListIndexedBy
  0.00      0.99     0.00        2     0.00     0.01  sqlite3TableLock
  0.00      0.99     0.00        2     0.00     0.00  sqlite3VdbeAddOp1
  0.00      0.99     0.00        2     0.00     0.00  sqlite3VdbeAddOp4
  0.00      0.99     0.00        2     0.00     0.00  sqlite3VdbeFreeCursor
  0.00      0.99     0.00        2     0.00     0.00  sqlite3VdbeSetNumCols
  0.00      0.99     0.00        2     0.00     0.00  sqlite3VdbeUsesBtree
  0.00      0.99     0.00        2     0.00     0.02  sqlite3WhereBegin
  0.00      0.99     0.00        2     0.00     0.00  sqlite3WhereEnd
  0.00      0.99     0.00        2     0.00     0.00  sqlite3_config
  0.00      0.99     0.00        2     0.00     0.00  sqlite3_errcode
  0.00      0.99     0.00        2     0.00     0.00  unixAccess
  0.00      0.99     0.00        2     0.00     0.00  unixFileSize
  0.00      0.99     0.00        2     0.00     0.00  unixLock
  0.00      0.99     0.00        2     0.00     0.00  unixSectorSize
  0.00      0.99     0.00        2     0.00     0.00  whereClauseClear
  0.00      0.99     0.00        2     0.00     0.00  whereInfoFree
  0.00      0.99     0.00        2     0.00     0.00  whereSplit
  0.00      0.99     0.00        1     0.00     0.00  global constructors keyed to _ZN16AssociativeCacheC2Eiiiiii
  0.00      0.99     0.00        1     0.00     0.00  global constructors keyed to _ZN30FinitePrefetchAssociativeCacheC2Eiiiiii
  0.00      0.99     0.00        1     0.00     0.00  global constructors keyed to _ZN32InfinitePrefetchAssociativeCacheC2Eiiiiii
  0.00      0.99     0.00        1     0.00     0.00  global constructors keyed to _ZN4PartC2Eiiiiii12PrefetchMode
  0.00      0.99     0.00        1     0.00     0.00  global constructors keyed to _ZN5CacheC2Eiiiiii
  0.00      0.99     0.00        1     0.00     0.00  global constructors keyed to main
  0.00      0.99     0.00        1     0.00   644.23  vappr_init(std::string)
  0.00      0.99     0.00        1     0.00     4.42  vappr_finalize()
  0.00      0.99     0.00        1     0.00     0.00  vappr_add_executor(Executor*)
  0.00      0.99     0.00        1     0.00   321.37  vappr_run_memory_accesses()
  0.00      0.99     0.00        1     0.00     0.00  Part::doReport(std::ostream&)
  0.00      0.99     0.00        1     0.00     0.00  Part::Part(int, int, int, int, int, int, PrefetchMode)
  0.00      0.99     0.00        1     0.00     0.00  closeUnixFile
  0.00      0.99     0.00        1     0.00     0.33  findLockInfo
  0.00      0.99     0.00        1     0.00     0.00  getSafetyLevel
  0.00      0.99     0.00        1     0.00     1.48  openDatabase
  0.00      0.99     0.00        1     0.00     0.00  pagerPagecount
  0.00      0.99     0.00        1     0.00     0.17  pcache1Create
  0.00      0.99     0.00        1     0.00     1.28  pcache1Destroy
  0.00      0.99     0.00        1     0.00     0.00  pcache1Init
  0.00      0.99     0.00        1     0.00     0.00  pcache1Pagecount
  0.00      0.99     0.00        1     0.00     1.28  pcache1Truncate
  0.00      0.99     0.00        1     0.00     0.00  posixIoFinderImpl
  0.00      0.99     0.00        1     0.00     0.00  releaseLockInfo
  0.00      0.99     0.00        1     0.00     0.00  saveAllCursors
  0.00      0.99     0.00        1     0.00     0.00  setupLookaside
  0.00      0.99     0.00        1     0.00     0.00  sqlite3AnalysisLoad
  0.00      0.99     0.00        1     0.00     1.92  sqlite3BtreeClose
  0.00      0.99     0.00        1     0.00     0.00  sqlite3BtreeCommit
  0.00      0.99     0.00        1     0.00     1.14  sqlite3BtreeFactory
  0.00      0.99     0.00        1     0.00     0.00  sqlite3BtreeRollback
  0.00      0.99     0.00        1     0.00     0.00  sqlite3CloseSavepoints
  0.00      0.99     0.00        1     0.00     0.00  sqlite3MPrintf
  0.00      0.99     0.00        1     0.00     0.00  sqlite3MallocAlarm
  0.00      0.99     0.00        1     0.00     0.00  sqlite3MemInit
  0.00      0.99     0.00        1     0.00     0.00  sqlite3MemRealloc
  0.00      0.99     0.00        1     0.00     0.00  sqlite3OsOpen
  0.00      0.99     0.00        1     0.00     0.00  sqlite3PageMalloc
  0.00      0.99     0.00        1     0.00     1.91  sqlite3PagerClose
  0.00      0.99     0.00        1     0.00     0.00  sqlite3Realloc
  0.00      0.99     0.00        1     0.00     0.00  sqlite3VMPrintf
  0.00      0.99     0.00        1     0.00     0.00  sqlite3ValueFree
  0.00      0.99     0.00        1     0.00     0.00  sqlite3ValueNew
  0.00      0.99     0.00        1     0.00     4.42  sqlite3_close
  0.00      0.99     0.00        1     0.00     0.00  sqlite3_mutex_alloc
  0.00      0.99     0.00        1     0.00     0.00  sqlite3_open
  0.00      0.99     0.00        1     0.00     0.00  sqlite3_os_init
  0.00      0.99     0.00        1     0.00     0.00  sqlite3_overload_function
  0.00      0.99     0.00        1     0.00     0.17  sqlite3_realloc
  0.00      0.99     0.00        1     0.00     0.17  sqlite3_vfs_find
  0.00      0.99     0.00        1     0.00     0.00  unixClose
  0.00      0.99     0.00        1     0.00     0.00  unixFullPathname
  0.00      0.99     0.00        1     0.00     0.50  unixOpen

 %         the percentage of the total running time of the
time       program used by this function.

cumulative a running sum of the number of seconds accounted
 seconds   for by this function and those listed above it.

 self      the number of seconds accounted for by this
seconds    function alone.  This is the major sort for this
           listing.

calls      the number of times this function was invoked, if
           this function is profiled, else blank.
 
 self      the average number of milliseconds spent in this
ms/call    function per call, if this function is profiled,
	   else blank.

 total     the average number of milliseconds spent in this
ms/call    function and its descendents per call, if this 
	   function is profiled, else blank.

name       the name of the function.  This is the minor sort
           for this listing. The index shows the location of
	   the function in the gprof listing. If the index is
	   in parenthesis it shows where it would appear in
	   the gprof listing if it were to be printed.

		     Call graph (explanation follows)


granularity: each sample hit covers 2 byte(s) for 1.01% of 0.99 seconds

index % time    self  children    called     name
                                                 <spontaneous>
[1]     98.0    0.00    0.97                 main [1]
                0.00    0.64       1/1           vappr_init(std::string) [4]
                0.00    0.32       1/1           vappr_run_memory_accesses() [10]
                0.00    0.00       1/1           vappr_finalize() [50]
                0.00    0.00       1/1           vappr_add_executor(Executor*) [902]
                0.00    0.00       1/1           Part::Part(int, int, int, int, int, int, PrefetchMode) [904]
-----------------------------------------------
[2]     97.4    0.00    0.96       3+291     <cycle 5 as a whole> [2]
                0.00    0.96      12             sqlite3_exec <cycle 5> [3]
                0.00    0.00     185             sqlite3Parser <cycle 5> [74]
                0.00    0.00       2             sqlite3Select <cycle 5> [77]
                0.00    0.00       2             selectExpander <cycle 5> [89]
                0.00    0.00      12             sqlite3RunParser <cycle 5> [100]
                0.00    0.00       2             sqlite3Pragma <cycle 5> [101]
                0.00    0.00       8             sqlite3StartTable <cycle 5> [102]
                0.00    0.00      12             sqlite3Prepare <cycle 5> [103]
                0.00    0.00       2             sqlite3InitOne <cycle 5> [124]
                0.00    0.00      12             sqlite3LockAndPrepare <cycle 5> [174]
                0.00    0.00       6+4           sqlite3WalkSelect <cycle 5> [178]
                0.00    0.00      12             sqlite3_prepare <cycle 5> [246]
                0.00    0.00      12             sqlite3ReadSchema <cycle 5> [245]
                0.00    0.00       8             sqlite3InitCallback <cycle 5> [259]
                0.00    0.00       3             sqlite3Init <cycle 5> [272]
                0.00    0.00       2             sqlite3SelectPrep <cycle 5> [289]
                0.00    0.00       2             sqlite3LocateTable <cycle 5> [285]
-----------------------------------------------
                                   1             sqlite3InitOne <cycle 5> [124]
                                   8             sqlite3InitCallback <cycle 5> [259]
                0.00    0.32       1/3           vappr_run_memory_accesses() [10]
                0.00    0.64       2/3           vappr_init(std::string) [4]
[3]     97.4    0.00    0.96      12         sqlite3_exec <cycle 5> [3]
                0.00    0.63 4047023/4047023     sqlite3_column_text [5]
                0.00    0.17  809419/809419      sqlite3_step [11]
                0.02    0.14  809401/809401      callback(void*, int, char**, char**) [13]
                0.00    0.00       8/8           columnName [117]
                0.00    0.00       2/62          sqlite3DbMallocZero [90]
                0.00    0.00      12/12          sqlite3VdbeFinalize [134]
                0.00    0.00      12/44          sqlite3Error [139]
                0.00    0.00      22/831346      sqlite3_free [52]
                0.00    0.00      12/5665887     sqlite3ApiExit [21]
                0.00    0.00      12/4964252     sqlite3_mutex_enter [44]
                0.00    0.00      24/809865      sqlite3DbFree [198]
                0.00    0.00      12/4964252     pthreadMutexEnter [191]
                0.00    0.00      12/4964252     pthreadMutexLeave [192]
                0.00    0.00      12/4964252     sqlite3_mutex_leave [193]
                0.00    0.00       8/8           sqlite3_column_name [261]
                                  12             sqlite3_prepare <cycle 5> [246]
                                   6             sqlite3InitCallback <cycle 5> [259]
-----------------------------------------------
                0.00    0.64       1/1           main [1]
[4]     65.1    0.00    0.64       1         vappr_init(std::string) [4]
                0.00    0.64       2/3           sqlite3_exec <cycle 5> [3]
                0.00    0.00       1/1           openDatabase [61]
                0.00    0.00       1/1           sqlite3_open [314]
-----------------------------------------------
                0.00    0.63 4047023/4047023     sqlite3_exec <cycle 5> [3]
[5]     63.7    0.00    0.63 4047023         sqlite3_column_text [5]
                0.03    0.55 4047023/4047031     sqlite3ValueText [6]
                0.01    0.02 4047023/4047023     columnMallocFailure [17]
                0.02    0.00 4047023/4047023     columnMem [25]
                0.00    0.00 4047023/4047031     sqlite3_value_text [196]
                0.00    0.00 4047023/4964252     pthreadMutexLeave [192]
                0.00    0.00 4047023/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       8/4047031     columnName [117]
                0.03    0.55 4047023/4047031     sqlite3_column_text [5]
[6]     58.1    0.03    0.55 4047031         sqlite3ValueText [6]
                0.01    0.54 4047011/4047011     sqlite3VdbeMemStringify [7]
                0.00    0.00      20/4047031     sqlite3VdbeChangeEncoding [26]
                0.00    0.00      20/4047043     sqlite3VdbeMemNulTerminate [195]
-----------------------------------------------
                0.01    0.54 4047011/4047011     sqlite3ValueText [6]
[7]     55.1    0.01    0.54 4047011         sqlite3VdbeMemStringify [7]
                0.02    0.47 4047011/4047012     sqlite3_snprintf [8]
                0.01    0.02 4047011/4047041     sqlite3VdbeMemGrow [23]
                0.02    0.00 4047011/4047031     sqlite3VdbeChangeEncoding [26]
-----------------------------------------------
                0.00    0.00       1/4047012     unixFullPathname [149]
                0.02    0.47 4047011/4047012     sqlite3VdbeMemStringify [7]
[8]     49.5    0.02    0.47 4047012         sqlite3_snprintf [8]
                0.43    0.03 4047012/4047013     sqlite3VXPrintf [9]
                0.01    0.00 4047012/4047013     sqlite3StrAccumFinish [36]
-----------------------------------------------
                0.00    0.00       1/4047013     sqlite3VMPrintf [151]
                0.43    0.03 4047012/4047013     sqlite3_snprintf [8]
[9]     46.5    0.43    0.03 4047013         sqlite3VXPrintf [9]
                0.03    0.00 4047017/4047017     sqlite3StrAccumAppend [18]
-----------------------------------------------
                0.00    0.32       1/1           main [1]
[10]    32.5    0.00    0.32       1         vappr_run_memory_accesses() [10]
                0.00    0.32       1/3           sqlite3_exec <cycle 5> [3]
-----------------------------------------------
                0.00    0.17  809419/809419      sqlite3_exec <cycle 5> [3]
[11]    17.5    0.00    0.17  809419         sqlite3_step [11]
                0.12    0.04  809419/809419      sqlite3VdbeExec [12]
                0.01    0.00 1618838/5665887     sqlite3ApiExit [21]
                0.00    0.00  809419/4964252     sqlite3_mutex_enter [44]
                0.00    0.00  809419/4964252     pthreadMutexEnter [191]
                0.00    0.00  809419/4964252     pthreadMutexLeave [192]
                0.00    0.00  809419/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.12    0.04  809419/809419      sqlite3_step [11]
[12]    16.6    0.12    0.04  809419         sqlite3VdbeExec [12]
                0.03    0.00 4047023/4047023     sqlite3VdbeSerialGet [24]
                0.00    0.01   21034/21251       moveToLeftmost [34]
                0.01    0.00 4047023/4047023     sqlite3VdbeMemStoreType [45]
                0.00    0.00  809407/809408      sqlite3VdbeMemRelease [57]
                0.00    0.00  809407/809407      sqlite3BtreeNext [69]
                0.00    0.00       2/2           sqlite3BtreeFirst [119]
                0.00    0.00       2/3           sqlite3BtreeBeginTrans [116]
                0.00    0.00 4047023/4047023     sqlite3VdbeMemMakeWriteable [163]
                0.00    0.00      12/24          sqlite3VdbeHalt [159]
                0.00    0.00       2/2           sqlite3VdbeFreeCursor [172]
                0.00    0.00       2/2           allocateCursor [173]
                0.00    0.00 4047023/4047023     sqlite3VdbeCursorMoveto [197]
                0.00    0.00 4047023/4047043     sqlite3VdbeMemNulTerminate [195]
                0.00    0.00 4047023/4856431     sqlite3VdbeMemReleaseExternal [194]
                0.00    0.00  809419/809431      sqlite3BtreeMutexArrayLeave [199]
                0.00    0.00  809407/809431      sqlite3VdbeCheckFk [200]
                0.00    0.00  809407/809407      sqlite3VdbeCloseStatement [204]
                0.00    0.00  809407/809407      btreeParseCellPtr [202]
                0.00    0.00  809407/809407      btreeParseCell [201]
                0.00    0.00       4/5           sqlite3GetVarint32 [266]
                0.00    0.00       2/2           sqlite3BtreeCursor [282]
                0.00    0.00       1/49          sqlite3BtreeLeave [226]
                0.00    0.00       1/6           sqlite3BtreeGetMeta [263]
-----------------------------------------------
                0.02    0.14  809401/809401      sqlite3_exec <cycle 5> [3]
[13]    16.2    0.02    0.14  809401         callback(void*, int, char**, char**) [13]
                0.01    0.07  239123/239123      Part::memRead(long, long, int) [14]
                0.00    0.04  229103/229103      Part::instruction(long) [16]
                0.00    0.01   50883/50883       Part::memWrite(long, long, int) [28]
                0.01    0.00  519204/519204      advanceTSC(long) [41]
                0.00    0.00      95/95          Part::memRead(long, long, long, int) [79]
-----------------------------------------------
                0.01    0.07  239123/239123      callback(void*, int, char**, char**) [13]
[14]     8.4    0.01    0.07  239123         Part::memRead(long, long, int) [14]
                0.04    0.00  478246/758517      Profiler::addToRead(long, long, long, long) [15]
                0.02    0.00  478246/809305      Profiler::addToUsage(long, long) [20]
                0.00    0.02  478246/758517      AssociativeCache::read(long, int) [22]
-----------------------------------------------
                0.00    0.00     285/758517      Part::memRead(long, long, long, int) [79]
                0.00    0.00   50883/758517      Part::memWrite(long, long, int) [28]
                0.02    0.00  229103/758517      Part::instruction(long) [16]
                0.04    0.00  478246/758517      Part::memRead(long, long, int) [14]
[15]     6.1    0.06    0.00  758517         Profiler::addToRead(long, long, long, long) [15]
                0.00    0.00   10324/11638       std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_unique_(std::_Rb_tree_const_iterator<std::pair<long const, Entry*> >, std::pair<long const, Entry*> const&) [887]
-----------------------------------------------
                0.00    0.04  229103/229103      callback(void*, int, char**, char**) [13]
[16]     3.5    0.00    0.04  229103         Part::instruction(long) [16]
                0.02    0.00  229103/758517      Profiler::addToRead(long, long, long, long) [15]
                0.01    0.00  229103/809305      Profiler::addToUsage(long, long) [20]
                0.00    0.01  229103/758517      AssociativeCache::read(long, int) [22]
-----------------------------------------------
                0.01    0.02 4047023/4047023     sqlite3_column_text [5]
[17]     3.2    0.01    0.02 4047023         columnMallocFailure [17]
                0.02    0.00 4047023/5665887     sqlite3ApiExit [21]
-----------------------------------------------
                0.03    0.00 4047017/4047017     sqlite3VXPrintf [9]
[18]     3.0    0.03    0.00 4047017         sqlite3StrAccumAppend [18]
-----------------------------------------------
                0.00    0.00   50883/809400      AssociativeCache::write(long, int) [60]
                0.01    0.02  758517/809400      AssociativeCache::read(long, int) [22]
[19]     3.0    0.01    0.02  809400         AssociativeCache::access(long, int, bool) [19]
                0.01    0.00  812052/812052      Cache::getTag(long) [39]
                0.01    0.00  809400/809400      AssociativeCache::getIndex(long) [40]
                0.00    0.00  809400/809400      RDTSC() [885]
-----------------------------------------------
                0.00    0.00     190/809305      Part::memRead(long, long, long, int) [79]
                0.00    0.00  101766/809305      Part::memWrite(long, long, int) [28]
                0.01    0.00  229103/809305      Part::instruction(long) [16]
                0.02    0.00  478246/809305      Part::memRead(long, long, int) [14]
[20]     3.0    0.03    0.00  809305         Profiler::addToUsage(long, long) [20]
-----------------------------------------------
                0.00    0.00       1/5665887     sqlite3_overload_function [138]
                0.00    0.00       1/5665887     openDatabase [61]
                0.00    0.00      12/5665887     sqlite3Prepare <cycle 5> [103]
                0.00    0.00      12/5665887     sqlite3_exec <cycle 5> [3]
                0.01    0.00 1618838/5665887     sqlite3_step [11]
                0.02    0.00 4047023/5665887     columnMallocFailure [17]
[21]     3.0    0.03    0.00 5665887         sqlite3ApiExit [21]
-----------------------------------------------
                0.00    0.00     285/758517      Part::memRead(long, long, long, int) [79]
                0.00    0.00   50883/758517      Part::memWrite(long, long, int) [28]
                0.00    0.01  229103/758517      Part::instruction(long) [16]
                0.00    0.02  478246/758517      Part::memRead(long, long, int) [14]
[22]     2.8    0.00    0.03  758517         AssociativeCache::read(long, int) [22]
                0.01    0.02  758517/809400      AssociativeCache::access(long, int, bool) [19]
-----------------------------------------------
                0.00    0.00       2/4047041     allocateCursor [173]
                0.00    0.00      12/4047041     sqlite3VdbeMemMakeWriteable [163]
                0.00    0.00      16/4047041     sqlite3VdbeMemSetStr [153]
                0.01    0.02 4047011/4047041     sqlite3VdbeMemStringify [7]
[23]     2.5    0.01    0.02 4047041         sqlite3VdbeMemGrow [23]
                0.02    0.00 4047041/4047059     sqlite3DbMallocSize [27]
                0.00    0.00      27/201         sqlite3DbMallocRaw [78]
                0.00    0.00      28/86298       sqlite3MemSize [37]
                0.00    0.00      26/831346      sqlite3_free [52]
                0.00    0.00      27/809865      sqlite3DbFree [198]
-----------------------------------------------
                0.03    0.00 4047023/4047023     sqlite3VdbeExec [12]
[24]     2.5    0.03    0.00 4047023         sqlite3VdbeSerialGet [24]
-----------------------------------------------
                0.02    0.00 4047023/4047023     sqlite3_column_text [5]
[25]     2.4    0.02    0.00 4047023         columnMem [25]
                0.00    0.00 4047023/4964252     sqlite3_mutex_enter [44]
                0.00    0.00 4047023/4964252     pthreadMutexEnter [191]
-----------------------------------------------
                0.00    0.00      20/4047031     sqlite3ValueText [6]
                0.02    0.00 4047011/4047031     sqlite3VdbeMemStringify [7]
[26]     2.0    0.02    0.00 4047031         sqlite3VdbeChangeEncoding [26]
-----------------------------------------------
                0.00    0.00       2/4047059     sqlite3VdbeMakeLabel [92]
                0.00    0.00       4/4047059     sqlite3ExprListAppend [81]
                0.00    0.00      12/4047059     growOpArray [76]
                0.02    0.00 4047041/4047059     sqlite3VdbeMemGrow [23]
[27]     1.5    0.02    0.00 4047059         sqlite3DbMallocSize [27]
-----------------------------------------------
                0.00    0.01   50883/50883       callback(void*, int, char**, char**) [13]
[28]     1.2    0.00    0.01   50883         Part::memWrite(long, long, int) [28]
                0.00    0.00   50883/758517      Profiler::addToRead(long, long, long, long) [15]
                0.00    0.00  101766/809305      Profiler::addToUsage(long, long) [20]
                0.00    0.00   50883/758517      AssociativeCache::read(long, int) [22]
                0.00    0.00   50883/50883       AssociativeCache::write(long, int) [60]
                0.00    0.00   50883/50883       Profiler::addToWrite(long, long, long, long) [886]
-----------------------------------------------
                0.00    0.00       2/21470       sqlite3BtreeBeginTrans [116]
                0.00    0.01   21468/21470       getAndInitPage [32]
[29]     1.2    0.00    0.01   21470         btreeGetPage [29]
                0.00    0.01   21470/21470       sqlite3PagerAcquire [30]
-----------------------------------------------
                0.00    0.01   21470/21470       btreeGetPage [29]
[30]     1.2    0.00    0.01   21470         sqlite3PagerAcquire [30]
                0.00    0.01   21470/21470       sqlite3PcacheFetch [31]
                0.00    0.00   21468/21472       sqlite3PagerPagecount [209]
                0.00    0.00   21468/21470       unixRead [214]
                0.00    0.00   21468/21470       sqlite3OsRead [212]
-----------------------------------------------
                0.00    0.01   21470/21470       sqlite3PagerAcquire [30]
[31]     1.2    0.00    0.01   21470         sqlite3PcacheFetch [31]
                0.00    0.01   21470/21470       pcache1Fetch [35]
                0.00    0.00       1/1           pcache1Create [70]
                0.00    0.00       1/3           pcache1Cachesize [185]
                0.00    0.00       1/4964252     pthreadMutexLeave [192]
                0.00    0.00       1/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       2/21468       moveToRoot [118]
                0.00    0.01   21466/21468       moveToChild [33]
[32]     1.2    0.00    0.01   21468         getAndInitPage [32]
                0.00    0.01   21468/21470       btreeGetPage [29]
                0.00    0.00   21468/21468       btreeInitPage [215]
-----------------------------------------------
                0.00    0.00     217/21466       sqlite3BtreeNext [69]
                0.00    0.01   21249/21466       moveToLeftmost [34]
[33]     1.2    0.00    0.01   21466         moveToChild [33]
                0.00    0.01   21466/21468       getAndInitPage [32]
-----------------------------------------------
                0.00    0.00     217/21251       sqlite3BtreeNext [69]
                0.00    0.01   21034/21251       sqlite3VdbeExec [12]
[34]     1.1    0.00    0.01   21251         moveToLeftmost [34]
                0.00    0.01   21249/21466       moveToChild [33]
-----------------------------------------------
                0.00    0.01   21470/21470       sqlite3PcacheFetch [31]
[35]     1.1    0.00    0.01   21470         pcache1Fetch [35]
                0.00    0.01   21468/21469       pcache1Alloc [42]
                0.00    0.00       8/15          sqlite3_malloc <cycle 4> [243]
                0.00    0.00   21478/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       8/21657       sqlite3Malloc [43]
                0.00    0.00       8/831346      sqlite3_free [52]
                0.00    0.00   21485/4964252     pthreadMutexLeave [192]
                0.00    0.00   21485/4964252     sqlite3_mutex_leave [193]
                0.00    0.00   21478/4964252     pthreadMutexEnter [191]
                0.00    0.00       7/9           sqlite3EndBenignMalloc [251]
                0.00    0.00       7/9           sqlite3BeginBenignMalloc [250]
                0.00    0.00       2/21470       pcache1PinPage [210]
-----------------------------------------------
                0.00    0.00       1/4047013     sqlite3VMPrintf [151]
                0.01    0.00 4047012/4047013     sqlite3_snprintf [8]
[36]     1.0    0.01    0.00 4047013         sqlite3StrAccumFinish [36]
                0.00    0.00       1/201         sqlite3DbMallocRaw [78]
-----------------------------------------------
                0.00    0.00       2/86298       sqlite3Realloc [142]
                0.00    0.00       4/86298       sqlite3ExprListAppend [81]
                0.00    0.00      12/86298       growOpArray [76]
                0.00    0.00      28/86298       sqlite3VdbeMemGrow [23]
                0.00    0.00   21469/86298       pcache1Alloc [42]
                0.00    0.00   21469/86298       pcache1Free [56]
                0.00    0.00   21657/86298       mallocWithAlarm [53]
                0.00    0.00   21657/86298       sqlite3_free [52]
[37]     1.0    0.01    0.00   86298         sqlite3MemSize [37]
-----------------------------------------------
                                                 <spontaneous>
[38]     1.0    0.01    0.00                 pthreadMutexTry [38]
-----------------------------------------------
                0.01    0.00  812052/812052      AssociativeCache::access(long, int, bool) [19]
[39]     1.0    0.01    0.00  812052         Cache::getTag(long) [39]
-----------------------------------------------
                0.01    0.00  809400/809400      AssociativeCache::access(long, int, bool) [19]
[40]     1.0    0.01    0.00  809400         AssociativeCache::getIndex(long) [40]
-----------------------------------------------
                0.01    0.00  519204/519204      callback(void*, int, char**, char**) [13]
[41]     1.0    0.01    0.00  519204         advanceTSC(long) [41]
-----------------------------------------------
                0.00    0.00       1/21469       sqlite3PageMalloc [131]
                0.00    0.01   21468/21469       pcache1Fetch [35]
[42]     1.0    0.00    0.01   21469         pcache1Alloc [42]
                0.00    0.00   21469/21657       sqlite3Malloc [43]
                0.00    0.00   21469/86298       sqlite3MemSize [37]
                0.00    0.00   21469/4964252     sqlite3_mutex_enter [44]
                0.00    0.00   21469/4964252     pthreadMutexLeave [192]
                0.00    0.00   21469/4964252     sqlite3_mutex_leave [193]
                0.00    0.00   21469/4964252     pthreadMutexEnter [191]
                0.00    0.00   21469/86254       sqlite3MallocSize [205]
-----------------------------------------------
                0.00    0.00       1/21657       setupLookaside [137]
                0.00    0.00       1/21657       sqlite3_initialize <cycle 4> [55]
                0.00    0.00       1/21657       pcache1Create [70]
                0.00    0.00       1/21657       unixOpen [67]
                0.00    0.00       1/21657       sqlite3BtreeFactory [65]
                0.00    0.00       2/21657       findLockInfo [68]
                0.00    0.00       8/21657       sqlite3MallocZero [108]
                0.00    0.00       8/21657       pcache1Fetch [35]
                0.00    0.00      11/21657       sqlite3HashInsert [104]
                0.00    0.00      12/21657       sqlite3RunParser <cycle 5> [100]
                0.00    0.00     142/21657       sqlite3DbMallocRaw [78]
                0.00    0.00   21469/21657       pcache1Alloc [42]
[43]     0.8    0.01    0.00   21657         sqlite3Malloc [43]
                0.00    0.00   21657/21657       mallocWithAlarm [53]
                0.00    0.00   21657/4964252     sqlite3_mutex_enter [44]
                0.00    0.00   21657/4964252     pthreadMutexEnter [191]
                0.00    0.00   21657/4964252     pthreadMutexLeave [192]
                0.00    0.00   21657/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       1/4964252     sqlite3Realloc [142]
                0.00    0.00       1/4964252     sqlite3PageMalloc [131]
                0.00    0.00       1/4964252     pcache1Pagecount [190]
                0.00    0.00       1/4964252     pcache1Truncate [64]
                0.00    0.00       1/4964252     pcache1Destroy [62]
                0.00    0.00       1/4964252     unixClose [162]
                0.00    0.00       1/4964252     pcache1Create [70]
                0.00    0.00       1/4964252     sqlite3_vfs_find [72]
                0.00    0.00       1/4964252     sqlite3_overload_function [138]
                0.00    0.00       1/4964252     sqlite3_close [49]
                0.00    0.00       1/4964252     openDatabase [61]
                0.00    0.00       2/4964252     unixUnlock [155]
                0.00    0.00       2/4964252     unixLock [157]
                0.00    0.00       2/4964252     unixOpen [67]
                0.00    0.00       3/4964252     sqlite3PageFree [135]
                0.00    0.00       3/4964252     pcache1Cachesize [185]
                0.00    0.00       4/4964252     sqlite3_vfs_register <cycle 4> [154]
                0.00    0.00       8/4964252     columnName [117]
                0.00    0.00      12/4964252     sqlite3LockAndPrepare <cycle 5> [174]
                0.00    0.00      12/4964252     sqlite3_exec <cycle 5> [3]
                0.00    0.00      21/4964252     sqlite3_initialize <cycle 4> [55]
                0.00    0.00   21469/4964252     pcache1Alloc [42]
                0.00    0.00   21469/4964252     pcache1Unpin [84]
                0.00    0.00   21478/4964252     pcache1Fetch [35]
                0.00    0.00   21657/4964252     sqlite3Malloc [43]
                0.00    0.00   21657/4964252     sqlite3_free [52]
                0.00    0.00  809419/4964252     sqlite3_step [11]
                0.00    0.00 4047023/4964252     columnMem [25]
[44]     0.5    0.01    0.00 4964252         sqlite3_mutex_enter [44]
-----------------------------------------------
                0.01    0.00 4047023/4047023     sqlite3VdbeExec [12]
[45]     0.5    0.01    0.00 4047023         sqlite3VdbeMemStoreType [45]
-----------------------------------------------
                0.00    0.00       1/2           sqlite3_initialize <cycle 4> [55]
                0.00    0.00       1/2           sqlite3_close [49]
[46]     0.5    0.01    0.00       2         sqlite3_mutex_free [46]
-----------------------------------------------
                                                 <spontaneous>
[47]     0.5    0.01    0.00                 dup8bytes [47]
-----------------------------------------------
                                                 <spontaneous>
[48]     0.5    0.01    0.00                 sqlite3_stmt_status [48]
-----------------------------------------------
                0.00    0.00       1/1           vappr_finalize() [50]
[49]     0.4    0.00    0.00       1         sqlite3_close [49]
                0.00    0.00       1/2           sqlite3_mutex_free [46]
                0.00    0.00       1/1           sqlite3BtreeClose [58]
                0.00    0.00       2/2           sqlite3ResetInternalSchema [143]
                0.00    0.00      13/831346      sqlite3_free [52]
                0.00    0.00       2/18          sqlite3HashClear [160]
                0.00    0.00       1/44          sqlite3Error [139]
                0.00    0.00       1/1           sqlite3ValueFree [184]
                0.00    0.00       1/4964252     sqlite3_mutex_enter [44]
                0.00    0.00      13/4964252     pthreadMutexLeave [192]
                0.00    0.00      13/4964252     sqlite3_mutex_leave [193]
                0.00    0.00      10/809865      sqlite3DbFree [198]
                0.00    0.00       1/4964252     pthreadMutexEnter [191]
                0.00    0.00       1/13          callFinaliser [240]
                0.00    0.00       1/1           sqlite3CloseSavepoints [308]
                0.00    0.00       1/2           pthreadMutexFree [277]
-----------------------------------------------
                0.00    0.00       1/1           main [1]
[50]     0.4    0.00    0.00       1         vappr_finalize() [50]
                0.00    0.00       1/1           sqlite3_close [49]
                0.00    0.00       1/1           Part::doReport(std::ostream&) [903]
-----------------------------------------------
                0.00    0.00       1/2           pcache1Truncate [64]
                0.00    0.00       1/2           pcache1Destroy [62]
[51]     0.3    0.00    0.00       2         pcache1TruncateUnsafe [51]
                0.00    0.00   21468/21471       pcache1Free [56]
                0.00    0.00   21468/831346      sqlite3_free [52]
                0.00    0.00   21468/21470       pcache1PinPage [210]
                0.00    0.00   21468/4964252     pthreadMutexLeave [192]
                0.00    0.00   21468/4964252     sqlite3_mutex_leave [193]
                0.00    0.00   21468/21468       pcache1FreePage [216]
-----------------------------------------------
                0.00    0.00       1/831346      sqlite3PageFree [135]
                0.00    0.00       1/831346      pcache1Destroy [62]
                0.00    0.00       1/831346      closeUnixFile [183]
                0.00    0.00       1/831346      sqlite3BtreeFactory [65]
                0.00    0.00       2/831346      unixClose [162]
                0.00    0.00       2/831346      sqlite3_initialize <cycle 4> [55]
                0.00    0.00       2/831346      sqlite3PagerClose [59]
                0.00    0.00       2/831346      sqlite3VdbeSetNumCols [127]
                0.00    0.00       3/831346      releaseAllSavepoints [166]
                0.00    0.00       3/831346      sqlite3BtreeClose [58]
                0.00    0.00       3/831346      releaseMemArray [179]
                0.00    0.00       4/831346      sqlite3BtreeCloseCursor [171]
                0.00    0.00       5/831346      sqlite3SrcListDelete <cycle 2> [170]
                0.00    0.00       5/831346      sqlite3Parser <cycle 5> [74]
                0.00    0.00       5/831346      selectExpander <cycle 5> [89]
                0.00    0.00       6/831346      sqlite3Select <cycle 5> [77]
                0.00    0.00       8/831346      sqlite3SchemaFree [140]
                0.00    0.00       8/831346      pcache1Fetch [35]
                0.00    0.00      10/831346      resolveP2Values [167]
                0.00    0.00      12/831346      sqlite3VdbeReset [145]
                0.00    0.00      12/831346      sqlite3VdbeFinalize [134]
                0.00    0.00      12/831346      sqlite3Prepare <cycle 5> [103]
                0.00    0.00      13/831346      sqlite3_close [49]
                0.00    0.00      16/831346      sqlite3DeleteTable <cycle 2> [132]
                0.00    0.00      17/831346      sqlite3ExprListDelete <cycle 3> [165]
                0.00    0.00      22/831346      sqlite3_exec <cycle 5> [3]
                0.00    0.00      26/831346      sqlite3VdbeMemGrow [23]
                0.00    0.00      29/831346      sqlite3HashClear [160]
                0.00    0.00      57/831346      sqlite3VdbeDelete [144]
                0.00    0.00      58/831346      sqlite3RunParser <cycle 5> [100]
                0.00    0.00     124/831346      sqliteResetColumnNames [133]
                0.00    0.00   21468/831346      pcache1TruncateUnsafe [51]
                0.00    0.00  809408/831346      sqlite3VdbeMemRelease [57]
[52]     0.3    0.00    0.00  831346         sqlite3_free [52]
                0.00    0.00   21657/86298       sqlite3MemSize [37]
                0.00    0.00   21657/4964252     sqlite3_mutex_enter [44]
                0.00    0.00   21657/4964252     pthreadMutexEnter [191]
                0.00    0.00   21657/86254       sqlite3MallocSize [205]
                0.00    0.00   21657/21657       sqlite3MemFree [207]
-----------------------------------------------
                0.00    0.00   21657/21657       sqlite3Malloc [43]
[53]     0.3    0.00    0.00   21657         mallocWithAlarm [53]
                0.00    0.00   21657/86298       sqlite3MemSize [37]
                0.00    0.00   21657/21658       sqlite3MemRoundup [206]
                0.00    0.00   21657/21657       sqlite3MemMalloc [208]
                0.00    0.00   21657/86254       sqlite3MallocSize [205]
-----------------------------------------------
[54]     0.3    0.00    0.00      15+26      <cycle 4 as a whole> [54]
                0.00    0.00      21             sqlite3_initialize <cycle 4> [55]
                0.00    0.00       4             sqlite3_vfs_register <cycle 4> [154]
                0.00    0.00       1             pcache1Init <cycle 4> [169]
                0.00    0.00      13             sqlite3_malloc <cycle 4> [243]
                0.00    0.00       1             sqlite3_mutex_alloc <cycle 4> [313]
                0.00    0.00       1             sqlite3_os_init <cycle 4> [315]
-----------------------------------------------
                                   1             sqlite3_mutex_alloc <cycle 4> [313]
                                   4             sqlite3_vfs_register <cycle 4> [154]
                                  13             sqlite3_malloc <cycle 4> [243]
                0.00    0.00       1/15          sqlite3_realloc [73]
                0.00    0.00       1/15          sqlite3_vfs_find [72]
                0.00    0.00       1/15          openDatabase [61]
[55]     0.3    0.00    0.00      21         sqlite3_initialize <cycle 4> [55]
                0.00    0.00       1/2           sqlite3_mutex_free [46]
                0.00    0.00       1/21657       sqlite3Malloc [43]
                0.00    0.00       9/30          pthreadMutexAlloc [123]
                0.00    0.00      21/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       2/831346      sqlite3_free [52]
                0.00    0.00      57/61          sqlite3FuncDefInsert [223]
                0.00    0.00      23/4964252     pthreadMutexLeave [192]
                0.00    0.00      23/4964252     sqlite3_mutex_leave [193]
                0.00    0.00      21/4964252     pthreadMutexEnter [191]
                0.00    0.00       9/29          sqlite3MutexAlloc [230]
                0.00    0.00       7/7           pthreadMutexInit [262]
                0.00    0.00       2/2           sqlite3_config [294]
                0.00    0.00       1/1           sqlite3MemInit [310]
                0.00    0.00       1/2           pthreadMutexFree [277]
                                   1             sqlite3_malloc <cycle 4> [243]
                                   1             sqlite3_os_init <cycle 4> [315]
                                   1             pcache1Init <cycle 4> [169]
-----------------------------------------------
                0.00    0.00       3/21471       sqlite3PageFree [135]
                0.00    0.00   21468/21471       pcache1TruncateUnsafe [51]
[56]     0.3    0.00    0.00   21471         pcache1Free [56]
                0.00    0.00   21469/86298       sqlite3MemSize [37]
                0.00    0.00   21469/86254       sqlite3MallocSize [205]
-----------------------------------------------
                0.00    0.00       1/809408      sqlite3ValueFree [184]
                0.00    0.00  809407/809408      sqlite3VdbeExec [12]
[57]     0.2    0.00    0.00  809408         sqlite3VdbeMemRelease [57]
                0.00    0.00  809408/831346      sqlite3_free [52]
                0.00    0.00  809408/4856431     sqlite3VdbeMemReleaseExternal [194]
                0.00    0.00  809408/809865      sqlite3DbFree [198]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3_close [49]
[58]     0.2    0.00    0.00       1         sqlite3BtreeClose [58]
                0.00    0.00       1/1           sqlite3PagerClose [59]
                0.00    0.00       1/3           sqlite3PageFree [135]
                0.00    0.00       1/4           sqlite3SchemaFree [140]
                0.00    0.00       3/831346      sqlite3_free [52]
                0.00    0.00       1/1           sqlite3BtreeRollback [182]
                0.00    0.00       4/4964252     pthreadMutexLeave [192]
                0.00    0.00       4/4964252     sqlite3_mutex_leave [193]
                0.00    0.00       1/49          sqlite3BtreeEnter [225]
                0.00    0.00       1/49          sqlite3BtreeLeave [226]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3BtreeClose [58]
[59]     0.2    0.00    0.00       1         sqlite3PagerClose [59]
                0.00    0.00       1/1           pcache1Destroy [62]
                0.00    0.00       1/2           pager_reset [63]
                0.00    0.00       1/3           sqlite3PageFree [135]
                0.00    0.00       1/3           pager_unlock [148]
                0.00    0.00       1/7           sqlite3OsClose [161]
                0.00    0.00       2/831346      sqlite3_free [52]
                0.00    0.00       3/4964252     pthreadMutexLeave [192]
                0.00    0.00       3/4964252     sqlite3_mutex_leave [193]
                0.00    0.00       1/9           sqlite3BeginBenignMalloc [250]
                0.00    0.00       1/9           sqlite3EndBenignMalloc [251]
                0.00    0.00       1/3           pagerUnlockAndRollback [270]
-----------------------------------------------
                0.00    0.00   50883/50883       Part::memWrite(long, long, int) [28]
[60]     0.2    0.00    0.00   50883         AssociativeCache::write(long, int) [60]
                0.00    0.00   50883/809400      AssociativeCache::access(long, int, bool) [19]
-----------------------------------------------
                0.00    0.00       1/1           vappr_init(std::string) [4]
[61]     0.1    0.00    0.00       1         openDatabase [61]
                0.00    0.00       1/1           sqlite3BtreeFactory [65]
                0.00    0.00       1/1           sqlite3_vfs_find [72]
                0.00    0.00       1/15          sqlite3_initialize <cycle 4> [55]
                0.00    0.00       5/5           createCollation [111]
                0.00    0.00       3/4           sqlite3CreateFunc [121]
                0.00    0.00       2/2           sqlite3SchemaGet [126]
                0.00    0.00       1/8           sqlite3MallocZero [108]
                0.00    0.00       1/1           setupLookaside [137]
                0.00    0.00       1/1           sqlite3_overload_function [138]
                0.00    0.00       1/12          sqlite3FindCollSeq [110]
                0.00    0.00       1/30          pthreadMutexAlloc [123]
                0.00    0.00       2/44          sqlite3Error [139]
                0.00    0.00       1/5665887     sqlite3ApiExit [21]
                0.00    0.00       1/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       2/2           sqlite3_errcode [295]
                0.00    0.00       1/29          sqlite3MutexAlloc [230]
                0.00    0.00       1/4964252     pthreadMutexEnter [191]
                0.00    0.00       1/4964252     pthreadMutexLeave [192]
                0.00    0.00       1/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3PagerClose [59]
[62]     0.1    0.00    0.00       1         pcache1Destroy [62]
                0.00    0.00       1/2           pcache1TruncateUnsafe [51]
                0.00    0.00       1/831346      sqlite3_free [52]
                0.00    0.00       1/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       2/4964252     pthreadMutexLeave [192]
                0.00    0.00       2/4964252     sqlite3_mutex_leave [193]
                0.00    0.00       1/4964252     pthreadMutexEnter [191]
                0.00    0.00       1/4           pcache1EnforceMaxPage [268]
-----------------------------------------------
                0.00    0.00       1/2           sqlite3PagerSetPagesize [66]
                0.00    0.00       1/2           sqlite3PagerClose [59]
[63]     0.1    0.00    0.00       2         pager_reset [63]
                0.00    0.00       1/1           pcache1Truncate [64]
                0.00    0.00       2/2           sqlite3PcacheTruncate [288]
                0.00    0.00       1/4964252     pthreadMutexLeave [192]
                0.00    0.00       1/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       1/1           pager_reset [63]
[64]     0.1    0.00    0.00       1         pcache1Truncate [64]
                0.00    0.00       1/2           pcache1TruncateUnsafe [51]
                0.00    0.00       1/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       1/4964252     pthreadMutexEnter [191]
-----------------------------------------------
                0.00    0.00       1/1           openDatabase [61]
[65]     0.1    0.00    0.00       1         sqlite3BtreeFactory [65]
                0.00    0.00       2/2           sqlite3PagerSetPagesize [66]
                0.00    0.00       1/1           unixOpen [67]
                0.00    0.00       3/8           sqlite3MallocZero [108]
                0.00    0.00       1/21657       sqlite3Malloc [43]
                0.00    0.00       1/2           sqlite3BtreeSchema [136]
                0.00    0.00       1/1           unixFullPathname [149]
                0.00    0.00       1/831346      sqlite3_free [52]
                0.00    0.00       1/3           sqlite3BtreeSetCacheSize [188]
                0.00    0.00       2/2           setSectorSize [281]
                0.00    0.00       1/4964252     pthreadMutexLeave [192]
                0.00    0.00       1/4964252     sqlite3_mutex_leave [193]
                0.00    0.00       1/1           sqlite3OsOpen [312]
                0.00    0.00       1/21470       unixRead [214]
                0.00    0.00       1/21470       sqlite3OsRead [212]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3BtreeFactory [65]
[66]     0.1    0.00    0.00       2         sqlite3PagerSetPagesize [66]
                0.00    0.00       1/2           pager_reset [63]
                0.00    0.00       1/1           sqlite3PageMalloc [131]
                0.00    0.00       1/3           sqlite3PageFree [135]
                0.00    0.00       1/4964252     pthreadMutexLeave [192]
                0.00    0.00       1/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3BtreeFactory [65]
[67]     0.1    0.00    0.00       1         unixOpen [67]
                0.00    0.00       1/1           findLockInfo [68]
                0.00    0.00       1/15          sqlite3_malloc <cycle 4> [243]
                0.00    0.00       1/21657       sqlite3Malloc [43]
                0.00    0.00       2/7           unixEnterMutex [146]
                0.00    0.00       2/7           unixLeaveMutex [147]
                0.00    0.00       2/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       2/4964252     pthreadMutexEnter [191]
                0.00    0.00       2/4964252     pthreadMutexLeave [192]
                0.00    0.00       2/4964252     sqlite3_mutex_leave [193]
                0.00    0.00       1/1           posixIoFinderImpl [304]
-----------------------------------------------
                0.00    0.00       1/1           unixOpen [67]
[68]     0.0    0.00    0.00       1         findLockInfo [68]
                0.00    0.00       2/15          sqlite3_malloc <cycle 4> [243]
                0.00    0.00       2/21657       sqlite3Malloc [43]
-----------------------------------------------
                0.00    0.00  809407/809407      sqlite3VdbeExec [12]
[69]     0.0    0.00    0.00  809407         sqlite3BtreeNext [69]
                0.00    0.00     217/21466       moveToChild [33]
                0.00    0.00     217/21251       moveToLeftmost [34]
                0.00    0.00   21466/21470       sqlite3PagerUnref [83]
                0.00    0.00   21466/21470       releasePage [211]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3PcacheFetch [31]
[70]     0.0    0.00    0.00       1         pcache1Create [70]
                0.00    0.00       1/15          sqlite3_malloc <cycle 4> [243]
                0.00    0.00       1/21657       sqlite3Malloc [43]
                0.00    0.00       1/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       1/4964252     pthreadMutexEnter [191]
                0.00    0.00       1/4964252     pthreadMutexLeave [192]
                0.00    0.00       1/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       4/28          sqlite3DbReallocOrFree [82]
                0.00    0.00       4/28          sqlite3ExprListAppend [81]
                0.00    0.00       8/28          sqlite3Parser <cycle 5> [74]
                0.00    0.00      12/28          growOpArray [76]
[71]     0.0    0.00    0.00      28         sqlite3DbRealloc [71]
                0.00    0.00       1/1           sqlite3_realloc [73]
                0.00    0.00       1/1           sqlite3Realloc [142]
-----------------------------------------------
                0.00    0.00       1/1           openDatabase [61]
[72]     0.0    0.00    0.00       1         sqlite3_vfs_find [72]
                0.00    0.00       1/15          sqlite3_initialize <cycle 4> [55]
                0.00    0.00       1/30          pthreadMutexAlloc [123]
                0.00    0.00       1/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       1/29          sqlite3MutexAlloc [230]
                0.00    0.00       1/4964252     pthreadMutexEnter [191]
                0.00    0.00       1/4964252     pthreadMutexLeave [192]
                0.00    0.00       1/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3DbRealloc [71]
[73]     0.0    0.00    0.00       1         sqlite3_realloc [73]
                0.00    0.00       1/15          sqlite3_initialize <cycle 4> [55]
-----------------------------------------------
                                 185             sqlite3RunParser <cycle 5> [100]
[74]     0.0    0.00    0.00     185         sqlite3Parser <cycle 5> [74]
                0.00    0.00       8/28          sqlite3DbRealloc [71]
                0.00    0.00      17/51          sqlite3VdbeAddOp3 [75]
                0.00    0.00      58/76          sqlite3NameFromToken [86]
                0.00    0.00      14/20          sqlite3GetVdbe [87]
                0.00    0.00       4/9           sqlite3ExprListAppend [81]
                0.00    0.00       2/2           sqlite3VdbeAddOp4 [105]
                0.00    0.00       8/8           sqlite3EndTable [107]
                0.00    0.00       8/201         sqlite3DbMallocRaw [78]
                0.00    0.00       2/2           sqlite3SrcListAppendFromTerm [114]
                0.00    0.00       3/3           sqlite3PExpr [122]
                0.00    0.00       3/86          sqlite3DbStrNDup [85]
                0.00    0.00       2/2           sqlite3SelectNew [128]
                0.00    0.00       2/2           sqlite3SrcListIndexedBy [130]
                0.00    0.00       1/6           sqlite3Expr [112]
                0.00    0.00       2/22          sqlite3SelectDelete <cycle 2> [189]
                0.00    0.00      12/12          sqlite3VdbeMakeReady [168]
                0.00    0.00       5/831346      sqlite3_free [52]
                0.00    0.00     710/710         yy_find_shift_action [217]
                0.00    0.00     278/278         yy_shift [218]
                0.00    0.00      29/29          sqlite3AffinityType [229]
                0.00    0.00      12/12          yy_destructor [248]
                0.00    0.00      12/22          sqlite3VdbeAddOp0 [232]
                0.00    0.00       5/809865      sqlite3DbFree [198]
                0.00    0.00       5/15          sqlite3VdbeAddOp2 [237]
                0.00    0.00       2/4964252     pthreadMutexLeave [192]
                0.00    0.00       2/4964252     sqlite3_mutex_leave [193]
                0.00    0.00       2/2           sqlite3VdbeUsesBtree [293]
                                   8             sqlite3StartTable <cycle 5> [102]
                                   2             sqlite3Pragma <cycle 5> [101]
                                   2             sqlite3Select <cycle 5> [77]
-----------------------------------------------
                0.00    0.00       2/51          sqlite3VdbeAddOp4 [105]
                0.00    0.00       2/51          sqlite3OpenTable [88]
                0.00    0.00       2/51          sqlite3CodeVerifySchema [99]
                0.00    0.00       2/51          selectInnerLoop [91]
                0.00    0.00       2/51          sqlite3WhereBegin [80]
                0.00    0.00       2/51          sqlite3Pragma <cycle 5> [101]
                0.00    0.00       4/51          sqlite3WhereEnd [98]
                0.00    0.00       8/51          sqlite3ExprCodeGetColumn [95]
                0.00    0.00      10/51          sqlite3GetVdbe [87]
                0.00    0.00      17/51          sqlite3Parser <cycle 5> [74]
[75]     0.0    0.00    0.00      51         sqlite3VdbeAddOp3 [75]
                0.00    0.00      12/12          growOpArray [76]
-----------------------------------------------
                0.00    0.00      12/12          sqlite3VdbeAddOp3 [75]
[76]     0.0    0.00    0.00      12         growOpArray [76]
                0.00    0.00      12/28          sqlite3DbRealloc [71]
                0.00    0.00      12/201         sqlite3DbMallocRaw [78]
                0.00    0.00      12/86298       sqlite3MemSize [37]
                0.00    0.00      12/4047059     sqlite3DbMallocSize [27]
-----------------------------------------------
                                   2             sqlite3Parser <cycle 5> [74]
[77]     0.0    0.00    0.00       2         sqlite3Select <cycle 5> [77]
                0.00    0.00       2/2           sqlite3WhereBegin [80]
                0.00    0.00       2/2           selectInnerLoop [91]
                0.00    0.00       2/2           sqlite3WhereEnd [98]
                0.00    0.00       2/8           sqlite3VdbeMakeLabel [92]
                0.00    0.00       2/20          sqlite3GetVdbe [87]
                0.00    0.00       2/2           generateColumnNames [125]
                0.00    0.00       6/831346      sqlite3_free [52]
                0.00    0.00       6/809865      sqlite3DbFree [198]
                0.00    0.00       2/20          sqlite3AuthCheck [233]
                0.00    0.00       2/2           computeLimitRegisters [276]
                0.00    0.00       2/4964252     pthreadMutexLeave [192]
                0.00    0.00       2/4964252     sqlite3_mutex_leave [193]
                0.00    0.00       2/2           whereInfoFree [300]
                                   2             sqlite3SelectPrep <cycle 5> [289]
-----------------------------------------------
                0.00    0.00       1/201         sqlite3StrAccumFinish [36]
                0.00    0.00       3/201         sqlite3ExprListAppend [81]
                0.00    0.00       4/201         sqlite3DbReallocOrFree [82]
                0.00    0.00       8/201         sqlite3Parser <cycle 5> [74]
                0.00    0.00      12/201         growOpArray [76]
                0.00    0.00      27/201         sqlite3VdbeMemGrow [23]
                0.00    0.00      62/201         sqlite3DbMallocZero [90]
                0.00    0.00      84/201         sqlite3DbStrNDup [85]
[78]     0.0    0.00    0.00     201         sqlite3DbMallocRaw [78]
                0.00    0.00     142/21657       sqlite3Malloc [43]
-----------------------------------------------
                0.00    0.00      95/95          callback(void*, int, char**, char**) [13]
[79]     0.0    0.00    0.00      95         Part::memRead(long, long, long, int) [79]
                0.00    0.00     285/758517      Profiler::addToRead(long, long, long, long) [15]
                0.00    0.00     285/758517      AssociativeCache::read(long, int) [22]
                0.00    0.00     190/809305      Profiler::addToUsage(long, long) [20]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3Select <cycle 5> [77]
[80]     0.0    0.00    0.00       2         sqlite3WhereBegin [80]
                0.00    0.00       2/2           sqlite3OpenTable [88]
                0.00    0.00       6/8           sqlite3VdbeMakeLabel [92]
                0.00    0.00       4/4           sqlite3CodeVerifySchema [99]
                0.00    0.00       2/51          sqlite3VdbeAddOp3 [75]
                0.00    0.00       2/62          sqlite3DbMallocZero [90]
                0.00    0.00       2/38          sqlite3WalkExpr <cycle 1> [176]
                0.00    0.00       4/6           sqlite3VdbeChangeP4 [265]
                0.00    0.00       2/2           whereSplit [301]
                0.00    0.00       2/2           bestBtreeIndex [273]
                0.00    0.00       2/15          sqlite3VdbeAddOp2 [237]
-----------------------------------------------
                0.00    0.00       4/9           sqlite3Parser <cycle 5> [74]
                0.00    0.00       5/9           selectExpander <cycle 5> [89]
[81]     0.0    0.00    0.00       9         sqlite3ExprListAppend [81]
                0.00    0.00       4/28          sqlite3DbRealloc [71]
                0.00    0.00       3/201         sqlite3DbMallocRaw [78]
                0.00    0.00       3/62          sqlite3DbMallocZero [90]
                0.00    0.00       4/86298       sqlite3MemSize [37]
                0.00    0.00       4/4047059     sqlite3DbMallocSize [27]
-----------------------------------------------
                0.00    0.00       2/4           sqlite3TableLock [93]
                0.00    0.00       2/4           sqlite3VdbeMakeLabel [92]
[82]     0.0    0.00    0.00       4         sqlite3DbReallocOrFree [82]
                0.00    0.00       4/28          sqlite3DbRealloc [71]
                0.00    0.00       4/201         sqlite3DbMallocRaw [78]
-----------------------------------------------
                0.00    0.00       2/21470       btreeEndTransaction [152]
                0.00    0.00       2/21470       sqlite3BtreeCloseCursor [171]
                0.00    0.00   21466/21470       sqlite3BtreeNext [69]
[83]     0.0    0.00    0.00   21470         sqlite3PagerUnref [83]
                0.00    0.00   21469/21469       pcache1Unpin [84]
                0.00    0.00   21470/21470       sqlite3PcacheRelease [213]
                0.00    0.00   21469/4964252     pthreadMutexLeave [192]
                0.00    0.00   21469/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00   21469/21469       sqlite3PagerUnref [83]
[84]     0.0    0.00    0.00   21469         pcache1Unpin [84]
                0.00    0.00   21469/4964252     sqlite3_mutex_enter [44]
                0.00    0.00   21469/4964252     pthreadMutexEnter [191]
-----------------------------------------------
                0.00    0.00       3/86          sqlite3Parser <cycle 5> [74]
                0.00    0.00       3/86          sqlite3Prepare <cycle 5> [103]
                0.00    0.00       5/86          sqlite3ExprListSetName [115]
                0.00    0.00      75/86          sqlite3NameFromToken [86]
[85]     0.0    0.00    0.00      86         sqlite3DbStrNDup [85]
                0.00    0.00      84/201         sqlite3DbMallocRaw [78]
-----------------------------------------------
                0.00    0.00       2/76          sqlite3SrcListIndexedBy [130]
                0.00    0.00       4/76          sqlite3SrcListAppend [113]
                0.00    0.00       4/76          sqlite3Pragma <cycle 5> [101]
                0.00    0.00       8/76          sqlite3StartTable <cycle 5> [102]
                0.00    0.00      58/76          sqlite3Parser <cycle 5> [74]
[86]     0.0    0.00    0.00      76         sqlite3NameFromToken [86]
                0.00    0.00      75/86          sqlite3DbStrNDup [85]
                0.00    0.00      75/75          sqlite3Dequote [222]
-----------------------------------------------
                0.00    0.00       2/20          sqlite3OpenTable [88]
                0.00    0.00       2/20          sqlite3CodeVerifySchema [99]
                0.00    0.00       2/20          sqlite3Select <cycle 5> [77]
                0.00    0.00      14/20          sqlite3Parser <cycle 5> [74]
[87]     0.0    0.00    0.00      20         sqlite3GetVdbe [87]
                0.00    0.00      10/51          sqlite3VdbeAddOp3 [75]
                0.00    0.00      10/12          sqlite3VdbeCreate [106]
                0.00    0.00      10/22          sqlite3VdbeAddOp0 [232]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3WhereBegin [80]
[88]     0.0    0.00    0.00       2         sqlite3OpenTable [88]
                0.00    0.00       2/2           sqlite3TableLock [93]
                0.00    0.00       2/51          sqlite3VdbeAddOp3 [75]
                0.00    0.00       2/20          sqlite3GetVdbe [87]
-----------------------------------------------
                                   2             sqlite3WalkSelect <cycle 5> [178]
[89]     0.0    0.00    0.00       2         selectExpander <cycle 5> [89]
                0.00    0.00       5/9           sqlite3ExprListAppend [81]
                0.00    0.00       5/6           sqlite3Expr [112]
                0.00    0.00       5/5           sqlite3ExprListSetName [115]
                0.00    0.00       5/831346      sqlite3_free [52]
                0.00    0.00       1/70          sqlite3ExprListDelete <cycle 3> [165]
                0.00    0.00       6/809865      sqlite3DbFree [198]
                0.00    0.00       2/2           sqlite3SrcListAssignCursors [290]
                0.00    0.00       2/2           sqlite3IndexedByLookup [284]
                                   2             sqlite3LocateTable <cycle 5> [285]
-----------------------------------------------
                0.00    0.00       1/62          sqlite3ValueNew [141]
                0.00    0.00       2/62          sqlite3SrcListAppend [113]
                0.00    0.00       2/62          sqlite3VdbeSetNumCols [127]
                0.00    0.00       2/62          sqlite3SelectNew [128]
                0.00    0.00       2/62          sqlite3WhereBegin [80]
                0.00    0.00       2/62          sqlite3_exec <cycle 5> [3]
                0.00    0.00       3/62          sqlite3FindCollSeq [110]
                0.00    0.00       3/62          sqlite3ExprListAppend [81]
                0.00    0.00       4/62          sqlite3FindFunction [120]
                0.00    0.00       8/62          sqlite3StartTable <cycle 5> [102]
                0.00    0.00       9/62          sqlite3ExprAlloc [109]
                0.00    0.00      12/62          sqlite3VdbeCreate [106]
                0.00    0.00      12/62          sqlite3Prepare <cycle 5> [103]
[90]     0.0    0.00    0.00      62         sqlite3DbMallocZero [90]
                0.00    0.00      62/201         sqlite3DbMallocRaw [78]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3Select <cycle 5> [77]
[91]     0.0    0.00    0.00       2         selectInnerLoop [91]
                0.00    0.00       2/2           sqlite3ExprCodeExprList [97]
                0.00    0.00       2/51          sqlite3VdbeAddOp3 [75]
                0.00    0.00       2/2           codeOffset [275]
                0.00    0.00       2/6           sqlite3ExprCacheClear [264]
                0.00    0.00       2/15          sqlite3VdbeAddOp2 [237]
-----------------------------------------------
                0.00    0.00       2/8           sqlite3Select <cycle 5> [77]
                0.00    0.00       6/8           sqlite3WhereBegin [80]
[92]     0.0    0.00    0.00       8         sqlite3VdbeMakeLabel [92]
                0.00    0.00       2/4           sqlite3DbReallocOrFree [82]
                0.00    0.00       2/4047059     sqlite3DbMallocSize [27]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3OpenTable [88]
[93]     0.0    0.00    0.00       2         sqlite3TableLock [93]
                0.00    0.00       2/4           sqlite3DbReallocOrFree [82]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3ExprCodeExprList [97]
[94]     0.0    0.00    0.00       8         sqlite3ExprCode [94]
                0.00    0.00       8/8           sqlite3ExprCodeTarget [96]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3ExprCodeTarget [96]
[95]     0.0    0.00    0.00       8         sqlite3ExprCodeGetColumn [95]
                0.00    0.00       8/51          sqlite3VdbeAddOp3 [75]
                0.00    0.00       8/8           sqlite3ColumnDefault [256]
                0.00    0.00       8/8           sqlite3ExprCacheStore [257]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3ExprCode [94]
[96]     0.0    0.00    0.00       8         sqlite3ExprCodeTarget [96]
                0.00    0.00       8/8           sqlite3ExprCodeGetColumn [95]
-----------------------------------------------
                0.00    0.00       2/2           selectInnerLoop [91]
[97]     0.0    0.00    0.00       2         sqlite3ExprCodeExprList [97]
                0.00    0.00       8/8           sqlite3ExprCode [94]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3Select <cycle 5> [77]
[98]     0.0    0.00    0.00       2         sqlite3WhereEnd [98]
                0.00    0.00       4/51          sqlite3VdbeAddOp3 [75]
                0.00    0.00       2/6           sqlite3ExprCacheClear [264]
                0.00    0.00       2/15          sqlite3VdbeAddOp2 [237]
                0.00    0.00       2/2           sqlite3VdbeAddOp1 [292]
-----------------------------------------------
                0.00    0.00       4/4           sqlite3WhereBegin [80]
[99]     0.0    0.00    0.00       4         sqlite3CodeVerifySchema [99]
                0.00    0.00       2/51          sqlite3VdbeAddOp3 [75]
                0.00    0.00       2/20          sqlite3GetVdbe [87]
                0.00    0.00       2/15          sqlite3VdbeAddOp2 [237]
-----------------------------------------------
                                  12             sqlite3Prepare <cycle 5> [103]
[100]    0.0    0.00    0.00      12         sqlite3RunParser <cycle 5> [100]
                0.00    0.00      12/21657       sqlite3Malloc [43]
                0.00    0.00      12/22          sqlite3DeleteTable <cycle 2> [132]
                0.00    0.00      58/831346      sqlite3_free [52]
                0.00    0.00     262/262         sqlite3GetToken [219]
                0.00    0.00      48/809865      sqlite3DbFree [198]
                0.00    0.00      12/4964252     pthreadMutexLeave [192]
                0.00    0.00      12/4964252     sqlite3_mutex_leave [193]
                0.00    0.00      12/12          sqlite3DeleteTrigger [244]
                                 185             sqlite3Parser <cycle 5> [74]
-----------------------------------------------
                                   2             sqlite3Parser <cycle 5> [74]
[101]    0.0    0.00    0.00       2         sqlite3Pragma <cycle 5> [101]
                0.00    0.00       2/51          sqlite3VdbeAddOp3 [75]
                0.00    0.00       4/76          sqlite3NameFromToken [86]
                0.00    0.00       2/12          sqlite3VdbeCreate [106]
                0.00    0.00       1/3           sqlite3BtreeSetCacheSize [188]
                0.00    0.00       4/809865      sqlite3DbFree [198]
                0.00    0.00       2/10          sqlite3TwoPartName [249]
                0.00    0.00       2/20          sqlite3AuthCheck [233]
                0.00    0.00       2/49          sqlite3BtreeLeave [226]
                0.00    0.00       2/15          sqlite3VdbeAddOp2 [237]
                0.00    0.00       2/49          sqlite3BtreeEnter [225]
                0.00    0.00       1/1           getSafetyLevel [302]
                                   2             sqlite3ReadSchema <cycle 5> [245]
-----------------------------------------------
                                   8             sqlite3Parser <cycle 5> [74]
[102]    0.0    0.00    0.00       8         sqlite3StartTable <cycle 5> [102]
                0.00    0.00       8/62          sqlite3DbMallocZero [90]
                0.00    0.00       8/76          sqlite3NameFromToken [86]
                0.00    0.00      16/20          sqlite3AuthCheck [233]
                0.00    0.00       8/10          sqlite3TwoPartName [249]
                0.00    0.00       8/8           sqlite3CheckObjectName [255]
                0.00    0.00       8/13          sqlite3FindTable [242]
                0.00    0.00       8/8           sqlite3FindIndex [258]
                                   8             sqlite3ReadSchema <cycle 5> [245]
-----------------------------------------------
                                  12             sqlite3LockAndPrepare <cycle 5> [174]
[103]    0.0    0.00    0.00      12         sqlite3Prepare <cycle 5> [103]
                0.00    0.00      12/62          sqlite3DbMallocZero [90]
                0.00    0.00       3/86          sqlite3DbStrNDup [85]
                0.00    0.00      12/44          sqlite3Error [139]
                0.00    0.00      12/5665887     sqlite3ApiExit [21]
                0.00    0.00      12/831346      sqlite3_free [52]
                0.00    0.00      12/49          sqlite3BtreeEnter [225]
                0.00    0.00      12/4964252     pthreadMutexLeave [192]
                0.00    0.00      12/4964252     sqlite3_mutex_leave [193]
                0.00    0.00      12/809865      sqlite3DbFree [198]
                0.00    0.00      12/49          sqlite3BtreeLeave [226]
                                  12             sqlite3RunParser <cycle 5> [100]
-----------------------------------------------
                0.00    0.00       3/11          sqlite3FindCollSeq [110]
                0.00    0.00       8/11          sqlite3EndTable [107]
[104]    0.0    0.00    0.00      11         sqlite3HashInsert [104]
                0.00    0.00      11/21657       sqlite3Malloc [43]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3Parser <cycle 5> [74]
[105]    0.0    0.00    0.00       2         sqlite3VdbeAddOp4 [105]
                0.00    0.00       2/51          sqlite3VdbeAddOp3 [75]
                0.00    0.00       2/6           sqlite3VdbeChangeP4 [265]
-----------------------------------------------
                0.00    0.00       2/12          sqlite3Pragma <cycle 5> [101]
                0.00    0.00      10/12          sqlite3GetVdbe [87]
[106]    0.0    0.00    0.00      12         sqlite3VdbeCreate [106]
                0.00    0.00      12/62          sqlite3DbMallocZero [90]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3Parser <cycle 5> [74]
[107]    0.0    0.00    0.00       8         sqlite3EndTable [107]
                0.00    0.00       8/11          sqlite3HashInsert [104]
-----------------------------------------------
                0.00    0.00       1/8           sqlite3BtreeSchema [136]
                0.00    0.00       1/8           sqlite3SchemaGet [126]
                0.00    0.00       1/8           openDatabase [61]
                0.00    0.00       2/8           pthreadMutexAlloc [123]
                0.00    0.00       3/8           sqlite3BtreeFactory [65]
[108]    0.0    0.00    0.00       8         sqlite3MallocZero [108]
                0.00    0.00       8/21657       sqlite3Malloc [43]
-----------------------------------------------
                0.00    0.00       3/9           sqlite3PExpr [122]
                0.00    0.00       6/9           sqlite3Expr [112]
[109]    0.0    0.00    0.00       9         sqlite3ExprAlloc [109]
                0.00    0.00       9/62          sqlite3DbMallocZero [90]
-----------------------------------------------
                0.00    0.00       1/12          openDatabase [61]
                0.00    0.00       1/12          sqlite3InitOne <cycle 5> [124]
                0.00    0.00      10/12          createCollation [111]
[110]    0.0    0.00    0.00      12         sqlite3FindCollSeq [110]
                0.00    0.00       3/11          sqlite3HashInsert [104]
                0.00    0.00       3/62          sqlite3DbMallocZero [90]
                0.00    0.00      12/42          sqlite3HashFind [228]
-----------------------------------------------
                0.00    0.00       5/5           openDatabase [61]
[111]    0.0    0.00    0.00       5         createCollation [111]
                0.00    0.00      10/12          sqlite3FindCollSeq [110]
                0.00    0.00       5/44          sqlite3Error [139]
-----------------------------------------------
                0.00    0.00       1/6           sqlite3Parser <cycle 5> [74]
                0.00    0.00       5/6           selectExpander <cycle 5> [89]
[112]    0.0    0.00    0.00       6         sqlite3Expr [112]
                0.00    0.00       6/9           sqlite3ExprAlloc [109]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3SrcListAppendFromTerm [114]
[113]    0.0    0.00    0.00       2         sqlite3SrcListAppend [113]
                0.00    0.00       4/76          sqlite3NameFromToken [86]
                0.00    0.00       2/62          sqlite3DbMallocZero [90]
                0.00    0.00       2/2           sqlite3SrcListEnlarge [291]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3Parser <cycle 5> [74]
[114]    0.0    0.00    0.00       2         sqlite3SrcListAppendFromTerm [114]
                0.00    0.00       2/2           sqlite3SrcListAppend [113]
-----------------------------------------------
                0.00    0.00       5/5           selectExpander <cycle 5> [89]
[115]    0.0    0.00    0.00       5         sqlite3ExprListSetName [115]
                0.00    0.00       5/86          sqlite3DbStrNDup [85]
-----------------------------------------------
                0.00    0.00       1/3           sqlite3InitOne <cycle 5> [124]
                0.00    0.00       2/3           sqlite3VdbeExec [12]
[116]    0.0    0.00    0.00       3         sqlite3BtreeBeginTrans [116]
                0.00    0.00       2/21470       btreeGetPage [29]
                0.00    0.00       2/2           pager_wait_on_lock [156]
                0.00    0.00       1/1           pcache1Pagecount [190]
                0.00    0.00       3/49          sqlite3BtreeEnter [225]
                0.00    0.00       3/49          sqlite3BtreeLeave [226]
                0.00    0.00       3/21472       sqlite3PagerPagecount [209]
                0.00    0.00       2/2           unixAccess [296]
                0.00    0.00       2/2           sqlite3OsAccess [286]
                0.00    0.00       1/21470       unixRead [214]
                0.00    0.00       1/21470       sqlite3OsRead [212]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3_exec <cycle 5> [3]
[117]    0.0    0.00    0.00       8         columnName [117]
                0.00    0.00       8/4047031     sqlite3ValueText [6]
                0.00    0.00       8/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       8/4964252     pthreadMutexEnter [191]
                0.00    0.00       8/4047031     sqlite3_value_text [196]
                0.00    0.00       8/4964252     pthreadMutexLeave [192]
                0.00    0.00       8/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3BtreeFirst [119]
[118]    0.0    0.00    0.00       2         moveToRoot [118]
                0.00    0.00       2/21468       getAndInitPage [32]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3VdbeExec [12]
[119]    0.0    0.00    0.00       2         sqlite3BtreeFirst [119]
                0.00    0.00       2/2           moveToRoot [118]
-----------------------------------------------
                0.00    0.00       1/9           sqlite3_overload_function [138]
                0.00    0.00       8/9           sqlite3CreateFunc [121]
[120]    0.0    0.00    0.00       9         sqlite3FindFunction [120]
                0.00    0.00       4/62          sqlite3DbMallocZero [90]
                0.00    0.00       4/61          sqlite3FuncDefInsert [223]
-----------------------------------------------
                0.00    0.00       1/4           sqlite3_overload_function [138]
                0.00    0.00       3/4           openDatabase [61]
[121]    0.0    0.00    0.00       4         sqlite3CreateFunc [121]
                0.00    0.00       8/9           sqlite3FindFunction [120]
-----------------------------------------------
                0.00    0.00       3/3           sqlite3Parser <cycle 5> [74]
[122]    0.0    0.00    0.00       3         sqlite3PExpr [122]
                0.00    0.00       3/9           sqlite3ExprAlloc [109]
                0.00    0.00       3/3           exprSetHeight [269]
                0.00    0.00       3/3           sqlite3ExprAttachSubtrees [271]
-----------------------------------------------
                0.00    0.00       1/30          sqlite3_vfs_find [72]
                0.00    0.00       1/30          pcache1Init <cycle 4> [169]
                0.00    0.00       1/30          openDatabase [61]
                0.00    0.00       4/30          sqlite3_vfs_register <cycle 4> [154]
                0.00    0.00       7/30          unixEnterMutex [146]
                0.00    0.00       7/30          unixLeaveMutex [147]
                0.00    0.00       9/30          sqlite3_initialize <cycle 4> [55]
[123]    0.0    0.00    0.00      30         pthreadMutexAlloc [123]
                0.00    0.00       2/8           sqlite3MallocZero [108]
-----------------------------------------------
                                   2             sqlite3Init <cycle 5> [272]
[124]    0.0    0.00    0.00       2         sqlite3InitOne <cycle 5> [124]
                0.00    0.00       1/3           sqlite3BtreeBeginTrans [116]
                0.00    0.00       1/12          sqlite3FindCollSeq [110]
                0.00    0.00       1/1           sqlite3MPrintf [150]
                0.00    0.00       1/1           sqlite3BtreeCommit [181]
                0.00    0.00       1/3           sqlite3BtreeSetCacheSize [188]
                0.00    0.00       6/49          sqlite3BtreeLeave [226]
                0.00    0.00       5/6           sqlite3BtreeGetMeta [263]
                0.00    0.00       2/13          sqlite3FindTable [242]
                0.00    0.00       1/49          sqlite3BtreeEnter [225]
                0.00    0.00       1/809865      sqlite3DbFree [198]
                0.00    0.00       1/1           sqlite3AnalysisLoad [307]
                                   2             sqlite3InitCallback <cycle 5> [259]
                                   1             sqlite3_exec <cycle 5> [3]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3Select <cycle 5> [77]
[125]    0.0    0.00    0.00       2         generateColumnNames [125]
                0.00    0.00       2/2           sqlite3VdbeSetNumCols [127]
                0.00    0.00      16/60          sqlite3VdbeMemSetStr [153]
                0.00    0.00      16/16          sqlite3VdbeSetColName [236]
                0.00    0.00       8/8           columnType [253]
-----------------------------------------------
                0.00    0.00       2/2           openDatabase [61]
[126]    0.0    0.00    0.00       2         sqlite3SchemaGet [126]
                0.00    0.00       1/8           sqlite3MallocZero [108]
                0.00    0.00       1/2           sqlite3BtreeSchema [136]
-----------------------------------------------
                0.00    0.00       2/2           generateColumnNames [125]
[127]    0.0    0.00    0.00       2         sqlite3VdbeSetNumCols [127]
                0.00    0.00       2/62          sqlite3DbMallocZero [90]
                0.00    0.00       2/831346      sqlite3_free [52]
                0.00    0.00       2/50          releaseMemArray [179]
                0.00    0.00       2/809865      sqlite3DbFree [198]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3Parser <cycle 5> [74]
[128]    0.0    0.00    0.00       2         sqlite3SelectNew [128]
                0.00    0.00       2/62          sqlite3DbMallocZero [90]
-----------------------------------------------
[129]    0.0    0.00    0.00      22+18      <cycle 2 as a whole> [129]
                0.00    0.00      22             sqlite3DeleteTable <cycle 2> [132]
                0.00    0.00       2             sqlite3SrcListDelete <cycle 2> [170]
                0.00    0.00       2             clearSelect <cycle 2> [180]
                0.00    0.00      14             sqlite3SelectDelete <cycle 2> [189]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3Parser <cycle 5> [74]
[130]    0.0    0.00    0.00       2         sqlite3SrcListIndexedBy [130]
                0.00    0.00       2/76          sqlite3NameFromToken [86]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3PagerSetPagesize [66]
[131]    0.0    0.00    0.00       1         sqlite3PageMalloc [131]
                0.00    0.00       1/21469       pcache1Alloc [42]
                0.00    0.00       1/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       1/4964252     pthreadMutexEnter [191]
                0.00    0.00       1/4964252     pthreadMutexLeave [192]
                0.00    0.00       1/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                                   2             sqlite3SrcListDelete <cycle 2> [170]
                0.00    0.00       8/22          sqlite3SchemaFree [140]
                0.00    0.00      12/22          sqlite3RunParser <cycle 5> [100]
[132]    0.0    0.00    0.00      22         sqlite3DeleteTable <cycle 2> [132]
                0.00    0.00       8/8           sqliteResetColumnNames [133]
                0.00    0.00      16/831346      sqlite3_free [52]
                0.00    0.00       8/70          sqlite3ExprDelete <cycle 3> [221]
                0.00    0.00      16/809865      sqlite3DbFree [198]
                0.00    0.00       8/4964252     pthreadMutexLeave [192]
                0.00    0.00       8/4964252     sqlite3_mutex_leave [193]
                                   8             sqlite3SelectDelete <cycle 2> [189]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3DeleteTable <cycle 2> [132]
[133]    0.0    0.00    0.00       8         sqliteResetColumnNames [133]
                0.00    0.00     124/831346      sqlite3_free [52]
                0.00    0.00      29/70          sqlite3ExprDelete <cycle 3> [221]
                0.00    0.00     124/809865      sqlite3DbFree [198]
                0.00    0.00      66/4964252     pthreadMutexLeave [192]
                0.00    0.00      66/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00      12/12          sqlite3_exec <cycle 5> [3]
[134]    0.0    0.00    0.00      12         sqlite3VdbeFinalize [134]
                0.00    0.00      12/12          sqlite3VdbeDelete [144]
                0.00    0.00      12/12          sqlite3VdbeReset [145]
                0.00    0.00      12/831346      sqlite3_free [52]
                0.00    0.00      12/4964252     pthreadMutexLeave [192]
                0.00    0.00      12/4964252     sqlite3_mutex_leave [193]
                0.00    0.00      12/809865      sqlite3DbFree [198]
-----------------------------------------------
                0.00    0.00       1/3           sqlite3PagerSetPagesize [66]
                0.00    0.00       1/3           sqlite3PagerClose [59]
                0.00    0.00       1/3           sqlite3BtreeClose [58]
[135]    0.0    0.00    0.00       3         sqlite3PageFree [135]
                0.00    0.00       3/21471       pcache1Free [56]
                0.00    0.00       1/831346      sqlite3_free [52]
                0.00    0.00       3/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       3/4964252     pthreadMutexEnter [191]
                0.00    0.00       1/4964252     pthreadMutexLeave [192]
                0.00    0.00       1/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       1/2           sqlite3SchemaGet [126]
                0.00    0.00       1/2           sqlite3BtreeFactory [65]
[136]    0.0    0.00    0.00       2         sqlite3BtreeSchema [136]
                0.00    0.00       1/8           sqlite3MallocZero [108]
                0.00    0.00       2/49          sqlite3BtreeEnter [225]
                0.00    0.00       2/49          sqlite3BtreeLeave [226]
-----------------------------------------------
                0.00    0.00       1/1           openDatabase [61]
[137]    0.0    0.00    0.00       1         setupLookaside [137]
                0.00    0.00       1/21657       sqlite3Malloc [43]
                0.00    0.00       1/9           sqlite3BeginBenignMalloc [250]
                0.00    0.00       1/9           sqlite3EndBenignMalloc [251]
-----------------------------------------------
                0.00    0.00       1/1           openDatabase [61]
[138]    0.0    0.00    0.00       1         sqlite3_overload_function [138]
                0.00    0.00       1/4           sqlite3CreateFunc [121]
                0.00    0.00       1/9           sqlite3FindFunction [120]
                0.00    0.00       1/5665887     sqlite3ApiExit [21]
                0.00    0.00       1/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       1/4964252     pthreadMutexEnter [191]
                0.00    0.00       1/4964252     pthreadMutexLeave [192]
                0.00    0.00       1/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       1/44          sqlite3_close [49]
                0.00    0.00       2/44          openDatabase [61]
                0.00    0.00       5/44          createCollation [111]
                0.00    0.00      12/44          sqlite3VdbeReset [145]
                0.00    0.00      12/44          sqlite3Prepare <cycle 5> [103]
                0.00    0.00      12/44          sqlite3_exec <cycle 5> [3]
[139]    0.0    0.00    0.00      44         sqlite3Error [139]
                0.00    0.00       1/1           sqlite3ValueNew [141]
                0.00    0.00      44/60          sqlite3VdbeMemSetStr [153]
-----------------------------------------------
                0.00    0.00       1/4           sqlite3BtreeClose [58]
                0.00    0.00       3/4           sqlite3ResetInternalSchema [143]
[140]    0.0    0.00    0.00       4         sqlite3SchemaFree [140]
                0.00    0.00       8/22          sqlite3DeleteTable <cycle 2> [132]
                0.00    0.00      16/18          sqlite3HashClear [160]
                0.00    0.00       8/831346      sqlite3_free [52]
                0.00    0.00       8/4964252     pthreadMutexLeave [192]
                0.00    0.00       8/4964252     sqlite3_mutex_leave [193]
                0.00    0.00       8/809865      sqlite3DbFree [198]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3Error [139]
[141]    0.0    0.00    0.00       1         sqlite3ValueNew [141]
                0.00    0.00       1/62          sqlite3DbMallocZero [90]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3DbRealloc [71]
[142]    0.0    0.00    0.00       1         sqlite3Realloc [142]
                0.00    0.00       2/86298       sqlite3MemSize [37]
                0.00    0.00       1/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       2/86254       sqlite3MallocSize [205]
                0.00    0.00       1/21658       sqlite3MemRoundup [206]
                0.00    0.00       1/4964252     pthreadMutexEnter [191]
                0.00    0.00       1/1           sqlite3MemRealloc [311]
                0.00    0.00       1/4964252     pthreadMutexLeave [192]
                0.00    0.00       1/4964252     sqlite3_mutex_leave [193]
                0.00    0.00       1/1           sqlite3MallocAlarm [309]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3_close [49]
[143]    0.0    0.00    0.00       2         sqlite3ResetInternalSchema [143]
                0.00    0.00       3/4           sqlite3SchemaFree [140]
                0.00    0.00       2/14          sqlite3BtreeLeaveAll [239]
                0.00    0.00       2/14          sqlite3BtreeEnterAll [238]
-----------------------------------------------
                0.00    0.00      12/12          sqlite3VdbeFinalize [134]
[144]    0.0    0.00    0.00      12         sqlite3VdbeDelete [144]
                0.00    0.00      57/831346      sqlite3_free [52]
                0.00    0.00      24/50          releaseMemArray [179]
                0.00    0.00      60/809865      sqlite3DbFree [198]
                0.00    0.00      14/4964252     pthreadMutexLeave [192]
                0.00    0.00      14/4964252     sqlite3_mutex_leave [193]
                0.00    0.00      12/12          vdbeFreeOpArray [247]
-----------------------------------------------
                0.00    0.00      12/12          sqlite3VdbeFinalize [134]
[145]    0.0    0.00    0.00      12         sqlite3VdbeReset [145]
                0.00    0.00      12/44          sqlite3Error [139]
                0.00    0.00      12/24          sqlite3VdbeHalt [159]
                0.00    0.00      12/831346      sqlite3_free [52]
                0.00    0.00      12/809865      sqlite3DbFree [198]
-----------------------------------------------
                0.00    0.00       1/7           unixClose [162]
                0.00    0.00       2/7           unixUnlock [155]
                0.00    0.00       2/7           unixLock [157]
                0.00    0.00       2/7           unixOpen [67]
[146]    0.0    0.00    0.00       7         unixEnterMutex [146]
                0.00    0.00       7/30          pthreadMutexAlloc [123]
                0.00    0.00       7/29          sqlite3MutexAlloc [230]
-----------------------------------------------
                0.00    0.00       1/7           unixClose [162]
                0.00    0.00       2/7           unixUnlock [155]
                0.00    0.00       2/7           unixLock [157]
                0.00    0.00       2/7           unixOpen [67]
[147]    0.0    0.00    0.00       7         unixLeaveMutex [147]
                0.00    0.00       7/30          pthreadMutexAlloc [123]
                0.00    0.00       7/29          sqlite3MutexAlloc [230]
-----------------------------------------------
                0.00    0.00       1/3           sqlite3PagerClose [59]
                0.00    0.00       2/3           btreeEndTransaction [152]
[148]    0.0    0.00    0.00       3         pager_unlock [148]
                0.00    0.00       3/4           unixUnlock [155]
                0.00    0.00       3/3           releaseAllSavepoints [166]
                0.00    0.00       3/7           sqlite3OsClose [161]
                0.00    0.00       3/17          sqlite3BitvecDestroy [234]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3BtreeFactory [65]
[149]    0.0    0.00    0.00       1         unixFullPathname [149]
                0.00    0.00       1/4047012     sqlite3_snprintf [8]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3InitOne <cycle 5> [124]
[150]    0.0    0.00    0.00       1         sqlite3MPrintf [150]
                0.00    0.00       1/1           sqlite3VMPrintf [151]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3MPrintf [150]
[151]    0.0    0.00    0.00       1         sqlite3VMPrintf [151]
                0.00    0.00       1/4047013     sqlite3VXPrintf [9]
                0.00    0.00       1/4047013     sqlite3StrAccumFinish [36]
-----------------------------------------------
                0.00    0.00       1/14          sqlite3BtreeRollback [182]
                0.00    0.00      13/14          sqlite3BtreeCommitPhaseTwo [158]
[152]    0.0    0.00    0.00      14         btreeEndTransaction [152]
                0.00    0.00       2/3           pager_unlock [148]
                0.00    0.00       2/21470       sqlite3PagerUnref [83]
                0.00    0.00      14/17          sqlite3BitvecDestroy [234]
                0.00    0.00       2/3           pagerUnlockAndRollback [270]
                0.00    0.00       2/21470       releasePage [211]
-----------------------------------------------
                0.00    0.00      16/60          generateColumnNames [125]
                0.00    0.00      44/60          sqlite3Error [139]
[153]    0.0    0.00    0.00      60         sqlite3VdbeMemSetStr [153]
                0.00    0.00      16/4047041     sqlite3VdbeMemGrow [23]
                0.00    0.00      44/44          sqlite3VdbeMemSetNull [227]
-----------------------------------------------
                                   4             sqlite3_os_init <cycle 4> [315]
[154]    0.0    0.00    0.00       4         sqlite3_vfs_register <cycle 4> [154]
                0.00    0.00       4/30          pthreadMutexAlloc [123]
                0.00    0.00       4/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       4/29          sqlite3MutexAlloc [230]
                0.00    0.00       4/4964252     pthreadMutexEnter [191]
                0.00    0.00       4/4964252     pthreadMutexLeave [192]
                0.00    0.00       4/4964252     sqlite3_mutex_leave [193]
                                   4             sqlite3_initialize <cycle 4> [55]
-----------------------------------------------
                0.00    0.00       1/4           unixClose [162]
                0.00    0.00       3/4           pager_unlock [148]
[155]    0.0    0.00    0.00       4         unixUnlock [155]
                0.00    0.00       2/7           unixEnterMutex [146]
                0.00    0.00       2/7           unixLeaveMutex [147]
                0.00    0.00       2/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       2/4964252     pthreadMutexEnter [191]
                0.00    0.00       2/4964252     pthreadMutexLeave [192]
                0.00    0.00       2/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3BtreeBeginTrans [116]
[156]    0.0    0.00    0.00       2         pager_wait_on_lock [156]
                0.00    0.00       2/2           unixLock [157]
-----------------------------------------------
                0.00    0.00       2/2           pager_wait_on_lock [156]
[157]    0.0    0.00    0.00       2         unixLock [157]
                0.00    0.00       2/7           unixEnterMutex [146]
                0.00    0.00       2/7           unixLeaveMutex [147]
                0.00    0.00       2/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       2/4964252     pthreadMutexEnter [191]
                0.00    0.00       2/4964252     pthreadMutexLeave [192]
                0.00    0.00       2/4964252     sqlite3_mutex_leave [193]
                0.00    0.00       2/2           rangeLock [278]
-----------------------------------------------
                0.00    0.00       1/13          sqlite3BtreeCommit [181]
                0.00    0.00      12/13          sqlite3VdbeHalt [159]
[158]    0.0    0.00    0.00      13         sqlite3BtreeCommitPhaseTwo [158]
                0.00    0.00      13/14          btreeEndTransaction [152]
                0.00    0.00      13/49          sqlite3BtreeEnter [225]
                0.00    0.00      13/49          sqlite3BtreeLeave [226]
-----------------------------------------------
                0.00    0.00      12/24          sqlite3VdbeReset [145]
                0.00    0.00      12/24          sqlite3VdbeExec [12]
[159]    0.0    0.00    0.00      24         sqlite3VdbeHalt [159]
                0.00    0.00      12/13          sqlite3BtreeCommitPhaseTwo [158]
                0.00    0.00      24/50          releaseMemArray [179]
                0.00    0.00      24/809431      sqlite3VdbeCheckFk [200]
                0.00    0.00      12/809431      sqlite3BtreeMutexArrayLeave [199]
                0.00    0.00      12/13          sqlite3BtreeCommitPhaseOne [241]
                0.00    0.00      12/13          callFinaliser [240]
-----------------------------------------------
                0.00    0.00       2/18          sqlite3_close [49]
                0.00    0.00      16/18          sqlite3SchemaFree [140]
[160]    0.0    0.00    0.00      18         sqlite3HashClear [160]
                0.00    0.00      29/831346      sqlite3_free [52]
                0.00    0.00      11/4964252     pthreadMutexLeave [192]
                0.00    0.00      11/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       1/7           sqlite3PagerClose [59]
                0.00    0.00       3/7           releaseAllSavepoints [166]
                0.00    0.00       3/7           pager_unlock [148]
[161]    0.0    0.00    0.00       7         sqlite3OsClose [161]
                0.00    0.00       1/1           unixClose [162]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3OsClose [161]
[162]    0.0    0.00    0.00       1         unixClose [162]
                0.00    0.00       1/4           unixUnlock [155]
                0.00    0.00       1/7           unixEnterMutex [146]
                0.00    0.00       1/7           unixLeaveMutex [147]
                0.00    0.00       2/831346      sqlite3_free [52]
                0.00    0.00       1/1           closeUnixFile [183]
                0.00    0.00       1/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       3/4964252     pthreadMutexLeave [192]
                0.00    0.00       3/4964252     sqlite3_mutex_leave [193]
                0.00    0.00       1/4964252     pthreadMutexEnter [191]
                0.00    0.00       1/1           releaseLockInfo [305]
-----------------------------------------------
                0.00    0.00 4047023/4047023     sqlite3VdbeExec [12]
[163]    0.0    0.00    0.00 4047023         sqlite3VdbeMemMakeWriteable [163]
                0.00    0.00      12/4047041     sqlite3VdbeMemGrow [23]
-----------------------------------------------
[164]    0.0    0.00    0.00      70+45      <cycle 3 as a whole> [164]
                0.00    0.00      16             sqlite3ExprListDelete <cycle 3> [165]
                0.00    0.00      90             sqlite3ExprDelete <cycle 3> [221]
                0.00    0.00       9             sqlite3ExprClear <cycle 3> [252]
-----------------------------------------------
                                   9             sqlite3ExprDelete <cycle 3> [221]
                0.00    0.00       1/70          selectExpander <cycle 5> [89]
                0.00    0.00       6/70          clearSelect <cycle 2> [180]
[165]    0.0    0.00    0.00      16         sqlite3ExprListDelete <cycle 3> [165]
                0.00    0.00      17/831346      sqlite3_free [52]
                0.00    0.00      30/809865      sqlite3DbFree [198]
                0.00    0.00       7/4964252     pthreadMutexLeave [192]
                0.00    0.00       7/4964252     sqlite3_mutex_leave [193]
                                   9             sqlite3ExprDelete <cycle 3> [221]
-----------------------------------------------
                0.00    0.00       3/3           pager_unlock [148]
[166]    0.0    0.00    0.00       3         releaseAllSavepoints [166]
                0.00    0.00       3/7           sqlite3OsClose [161]
                0.00    0.00       3/831346      sqlite3_free [52]
-----------------------------------------------
                0.00    0.00      12/12          sqlite3VdbeMakeReady [168]
[167]    0.0    0.00    0.00      12         resolveP2Values [167]
                0.00    0.00      10/831346      sqlite3_free [52]
                0.00    0.00      12/809865      sqlite3DbFree [198]
-----------------------------------------------
                0.00    0.00      12/12          sqlite3Parser <cycle 5> [74]
[168]    0.0    0.00    0.00      12         sqlite3VdbeMakeReady [168]
                0.00    0.00      12/12          resolveP2Values [167]
-----------------------------------------------
                                   1             sqlite3_initialize <cycle 4> [55]
[169]    0.0    0.00    0.00       1         pcache1Init <cycle 4> [169]
                0.00    0.00       1/30          pthreadMutexAlloc [123]
                                   1             sqlite3_mutex_alloc <cycle 4> [313]
-----------------------------------------------
                                   2             clearSelect <cycle 2> [180]
[170]    0.0    0.00    0.00       2         sqlite3SrcListDelete <cycle 2> [170]
                0.00    0.00       5/831346      sqlite3_free [52]
                0.00    0.00       2/70          sqlite3ExprDelete <cycle 3> [221]
                0.00    0.00       8/809865      sqlite3DbFree [198]
                0.00    0.00       2/2           sqlite3IdListDelete [283]
                                   2             sqlite3DeleteTable <cycle 2> [132]
                                   2             sqlite3SelectDelete <cycle 2> [189]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3VdbeFreeCursor [172]
[171]    0.0    0.00    0.00       2         sqlite3BtreeCloseCursor [171]
                0.00    0.00       4/831346      sqlite3_free [52]
                0.00    0.00       2/21470       sqlite3PagerUnref [83]
                0.00    0.00       2/49          sqlite3BtreeEnter [225]
                0.00    0.00       2/21470       releasePage [211]
                0.00    0.00       2/49          sqlite3BtreeLeave [226]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3VdbeExec [12]
[172]    0.0    0.00    0.00       2         sqlite3VdbeFreeCursor [172]
                0.00    0.00       2/2           sqlite3BtreeCloseCursor [171]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3VdbeExec [12]
[173]    0.0    0.00    0.00       2         allocateCursor [173]
                0.00    0.00       2/4047041     sqlite3VdbeMemGrow [23]
-----------------------------------------------
                                  12             sqlite3_prepare <cycle 5> [246]
[174]    0.0    0.00    0.00      12         sqlite3LockAndPrepare <cycle 5> [174]
                0.00    0.00      12/4964252     sqlite3_mutex_enter [44]
                0.00    0.00      12/4964252     pthreadMutexEnter [191]
                0.00    0.00      12/14          sqlite3BtreeEnterAll [238]
                0.00    0.00      12/14          sqlite3BtreeLeaveAll [239]
                0.00    0.00      12/4964252     pthreadMutexLeave [192]
                0.00    0.00      12/4964252     sqlite3_mutex_leave [193]
                                  12             sqlite3Prepare <cycle 5> [103]
-----------------------------------------------
[175]    0.0    0.00    0.00      38+32      <cycle 1 as a whole> [175]
                0.00    0.00      42+32          sqlite3WalkExpr <cycle 1> [176]
                0.00    0.00      28             sqlite3WalkExprList <cycle 1> [231]
-----------------------------------------------
                                  32             sqlite3WalkExpr <cycle 1> [176]
                                  16             sqlite3WalkExprList <cycle 1> [231]
                0.00    0.00       2/38          sqlite3WhereBegin [80]
                0.00    0.00       8/38          sqlite3ResolveExprNames [186]
                0.00    0.00      16/38          sqlite3WalkSelect <cycle 5> [178]
[176]    0.0    0.00    0.00      42+32      sqlite3WalkExpr <cycle 1> [176]
                0.00    0.00       8/8           lookupName [177]
                0.00    0.00      16/16          exprWalkNoop [235]
                0.00    0.00       8/8           resolveExprStep [254]
                                  16             sqlite3WalkExprList <cycle 1> [231]
                                  32             sqlite3WalkExpr <cycle 1> [176]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3WalkExpr <cycle 1> [176]
[177]    0.0    0.00    0.00       8         lookupName [177]
                0.00    0.00      16/70          sqlite3ExprDelete <cycle 3> [221]
-----------------------------------------------
                                   4             sqlite3WalkSelect <cycle 5> [178]
                                   6             sqlite3SelectPrep <cycle 5> [289]
[178]    0.0    0.00    0.00       6+4       sqlite3WalkSelect <cycle 5> [178]
                0.00    0.00      16/38          sqlite3WalkExpr <cycle 1> [176]
                0.00    0.00      12/38          sqlite3WalkExprList <cycle 1> [231]
                0.00    0.00       2/2           resolveSelectStep [187]
                0.00    0.00       2/2           selectAddSubqueryTypeInfo [280]
                                   2             selectExpander <cycle 5> [89]
                                   4             sqlite3WalkSelect <cycle 5> [178]
-----------------------------------------------
                0.00    0.00       2/50          sqlite3VdbeSetNumCols [127]
                0.00    0.00      24/50          sqlite3VdbeDelete [144]
                0.00    0.00      24/50          sqlite3VdbeHalt [159]
[179]    0.0    0.00    0.00      50         releaseMemArray [179]
                0.00    0.00       3/831346      sqlite3_free [52]
                0.00    0.00      26/809865      sqlite3DbFree [198]
                0.00    0.00       3/4964252     pthreadMutexLeave [192]
                0.00    0.00       3/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                                   2             sqlite3SelectDelete <cycle 2> [189]
[180]    0.0    0.00    0.00       2         clearSelect <cycle 2> [180]
                0.00    0.00       6/70          sqlite3ExprListDelete <cycle 3> [165]
                0.00    0.00       6/70          sqlite3ExprDelete <cycle 3> [221]
                0.00    0.00       4/809865      sqlite3DbFree [198]
                                   2             sqlite3SrcListDelete <cycle 2> [170]
                                   2             sqlite3SelectDelete <cycle 2> [189]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3InitOne <cycle 5> [124]
[181]    0.0    0.00    0.00       1         sqlite3BtreeCommit [181]
                0.00    0.00       1/13          sqlite3BtreeCommitPhaseTwo [158]
                0.00    0.00       1/49          sqlite3BtreeEnter [225]
                0.00    0.00       1/13          sqlite3BtreeCommitPhaseOne [241]
                0.00    0.00       1/49          sqlite3BtreeLeave [226]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3BtreeClose [58]
[182]    0.0    0.00    0.00       1         sqlite3BtreeRollback [182]
                0.00    0.00       1/14          btreeEndTransaction [152]
                0.00    0.00       1/49          sqlite3BtreeEnter [225]
                0.00    0.00       1/1           saveAllCursors [306]
                0.00    0.00       1/49          sqlite3BtreeLeave [226]
-----------------------------------------------
                0.00    0.00       1/1           unixClose [162]
[183]    0.0    0.00    0.00       1         closeUnixFile [183]
                0.00    0.00       1/831346      sqlite3_free [52]
                0.00    0.00       1/4964252     pthreadMutexLeave [192]
                0.00    0.00       1/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3_close [49]
[184]    0.0    0.00    0.00       1         sqlite3ValueFree [184]
                0.00    0.00       1/809408      sqlite3VdbeMemRelease [57]
-----------------------------------------------
                0.00    0.00       1/3           sqlite3PcacheFetch [31]
                0.00    0.00       2/3           sqlite3BtreeSetCacheSize [188]
[185]    0.0    0.00    0.00       3         pcache1Cachesize [185]
                0.00    0.00       3/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       3/4964252     pthreadMutexEnter [191]
                0.00    0.00       3/4           pcache1EnforceMaxPage [268]
-----------------------------------------------
                0.00    0.00      16/16          resolveSelectStep [187]
[186]    0.0    0.00    0.00      16         sqlite3ResolveExprNames [186]
                0.00    0.00       8/38          sqlite3WalkExpr <cycle 1> [176]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3WalkSelect <cycle 5> [178]
[187]    0.0    0.00    0.00       2         resolveSelectStep [187]
                0.00    0.00      16/16          sqlite3ResolveExprNames [186]
                0.00    0.00       2/2           resolveOrderGroupBy [279]
-----------------------------------------------
                0.00    0.00       1/3           sqlite3BtreeFactory [65]
                0.00    0.00       1/3           sqlite3InitOne <cycle 5> [124]
                0.00    0.00       1/3           sqlite3Pragma <cycle 5> [101]
[188]    0.0    0.00    0.00       3         sqlite3BtreeSetCacheSize [188]
                0.00    0.00       2/3           pcache1Cachesize [185]
                0.00    0.00       3/49          sqlite3BtreeEnter [225]
                0.00    0.00       3/49          sqlite3BtreeLeave [226]
                0.00    0.00       2/4964252     pthreadMutexLeave [192]
                0.00    0.00       2/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                                   2             sqlite3SrcListDelete <cycle 2> [170]
                                   2             clearSelect <cycle 2> [180]
                                   8             sqlite3DeleteTable <cycle 2> [132]
                0.00    0.00       2/22          sqlite3Parser <cycle 5> [74]
[189]    0.0    0.00    0.00      14         sqlite3SelectDelete <cycle 2> [189]
                0.00    0.00       2/70          sqlite3ExprDelete <cycle 3> [221]
                                   2             clearSelect <cycle 2> [180]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3BtreeBeginTrans [116]
[190]    0.0    0.00    0.00       1         pcache1Pagecount [190]
                0.00    0.00       1/4964252     sqlite3_mutex_enter [44]
                0.00    0.00       1/4964252     pthreadMutexEnter [191]
                0.00    0.00       1/4964252     pthreadMutexLeave [192]
                0.00    0.00       1/4964252     sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00       1/4964252     sqlite3Realloc [142]
                0.00    0.00       1/4964252     sqlite3PageMalloc [131]
                0.00    0.00       1/4964252     pcache1Pagecount [190]
                0.00    0.00       1/4964252     pcache1Truncate [64]
                0.00    0.00       1/4964252     pcache1Destroy [62]
                0.00    0.00       1/4964252     unixClose [162]
                0.00    0.00       1/4964252     pcache1Create [70]
                0.00    0.00       1/4964252     sqlite3_vfs_find [72]
                0.00    0.00       1/4964252     sqlite3_overload_function [138]
                0.00    0.00       1/4964252     sqlite3_close [49]
                0.00    0.00       1/4964252     openDatabase [61]
                0.00    0.00       2/4964252     unixUnlock [155]
                0.00    0.00       2/4964252     unixLock [157]
                0.00    0.00       2/4964252     unixOpen [67]
                0.00    0.00       3/4964252     sqlite3PageFree [135]
                0.00    0.00       3/4964252     pcache1Cachesize [185]
                0.00    0.00       4/4964252     sqlite3_vfs_register <cycle 4> [154]
                0.00    0.00       8/4964252     columnName [117]
                0.00    0.00      12/4964252     sqlite3LockAndPrepare <cycle 5> [174]
                0.00    0.00      12/4964252     sqlite3_exec <cycle 5> [3]
                0.00    0.00      21/4964252     sqlite3_initialize <cycle 4> [55]
                0.00    0.00   21469/4964252     pcache1Alloc [42]
                0.00    0.00   21469/4964252     pcache1Unpin [84]
                0.00    0.00   21478/4964252     pcache1Fetch [35]
                0.00    0.00   21657/4964252     sqlite3Malloc [43]
                0.00    0.00   21657/4964252     sqlite3_free [52]
                0.00    0.00  809419/4964252     sqlite3_step [11]
                0.00    0.00 4047023/4964252     columnMem [25]
[191]    0.0    0.00    0.00 4964252         pthreadMutexEnter [191]
-----------------------------------------------
                0.00    0.00       1/4964252     sqlite3Realloc [142]
                0.00    0.00       1/4964252     sqlite3PageMalloc [131]
                0.00    0.00       1/4964252     sqlite3PageFree [135]
                0.00    0.00       1/4964252     pcache1Pagecount [190]
                0.00    0.00       1/4964252     pager_reset [63]
                0.00    0.00       1/4964252     sqlite3PagerSetPagesize [66]
                0.00    0.00       1/4964252     sqlite3PcacheFetch [31]
                0.00    0.00       1/4964252     closeUnixFile [183]
                0.00    0.00       1/4964252     pcache1Create [70]
                0.00    0.00       1/4964252     sqlite3_vfs_find [72]
                0.00    0.00       1/4964252     sqlite3_overload_function [138]
                0.00    0.00       1/4964252     sqlite3BtreeFactory [65]
                0.00    0.00       1/4964252     openDatabase [61]
                0.00    0.00       2/4964252     pcache1Destroy [62]
                0.00    0.00       2/4964252     sqlite3BtreeSetCacheSize [188]
                0.00    0.00       2/4964252     unixUnlock [155]
                0.00    0.00       2/4964252     unixLock [157]
                0.00    0.00       2/4964252     unixOpen [67]
                0.00    0.00       2/4964252     sqlite3Select <cycle 5> [77]
                0.00    0.00       2/4964252     sqlite3Parser <cycle 5> [74]
                0.00    0.00       3/4964252     unixClose [162]
                0.00    0.00       3/4964252     sqlite3PagerClose [59]
                0.00    0.00       3/4964252     releaseMemArray [179]
                0.00    0.00       4/4964252     sqlite3_vfs_register <cycle 4> [154]
                0.00    0.00       4/4964252     sqlite3BtreeClose [58]
                0.00    0.00       7/4964252     sqlite3ExprListDelete <cycle 3> [165]
                0.00    0.00       8/4964252     columnName [117]
                0.00    0.00       8/4964252     sqlite3DeleteTable <cycle 2> [132]
                0.00    0.00       8/4964252     sqlite3SchemaFree [140]
                0.00    0.00      11/4964252     sqlite3HashClear [160]
                0.00    0.00      12/4964252     sqlite3VdbeFinalize [134]
                0.00    0.00      12/4964252     sqlite3RunParser <cycle 5> [100]
                0.00    0.00      12/4964252     sqlite3Prepare <cycle 5> [103]
                0.00    0.00      12/4964252     sqlite3LockAndPrepare <cycle 5> [174]
                0.00    0.00      12/4964252     sqlite3_exec <cycle 5> [3]
                0.00    0.00      13/4964252     sqlite3_close [49]
                0.00    0.00      14/4964252     sqlite3VdbeDelete [144]
                0.00    0.00      23/4964252     sqlite3_initialize <cycle 4> [55]
                0.00    0.00      66/4964252     sqliteResetColumnNames [133]
                0.00    0.00   21468/4964252     pcache1TruncateUnsafe [51]
                0.00    0.00   21469/4964252     pcache1Alloc [42]
                0.00    0.00   21469/4964252     sqlite3PagerUnref [83]
                0.00    0.00   21485/4964252     pcache1Fetch [35]
                0.00    0.00   21657/4964252     sqlite3Malloc [43]
                0.00    0.00  809419/4964252     sqlite3_step [11]
                0.00    0.00 4047023/4964252     sqlite3_column_text [5]
[192]    0.0    0.00    0.00 4964252         pthreadMutexLeave [192]
-----------------------------------------------
                0.00    0.00       1/4964252     sqlite3Realloc [142]
                0.00    0.00       1/4964252     sqlite3PageMalloc [131]
                0.00    0.00       1/4964252     sqlite3PageFree [135]
                0.00    0.00       1/4964252     pcache1Pagecount [190]
                0.00    0.00       1/4964252     pager_reset [63]
                0.00    0.00       1/4964252     sqlite3PagerSetPagesize [66]
                0.00    0.00       1/4964252     sqlite3PcacheFetch [31]
                0.00    0.00       1/4964252     closeUnixFile [183]
                0.00    0.00       1/4964252     pcache1Create [70]
                0.00    0.00       1/4964252     sqlite3_vfs_find [72]
                0.00    0.00       1/4964252     sqlite3_overload_function [138]
                0.00    0.00       1/4964252     sqlite3BtreeFactory [65]
                0.00    0.00       1/4964252     openDatabase [61]
                0.00    0.00       2/4964252     pcache1Destroy [62]
                0.00    0.00       2/4964252     sqlite3BtreeSetCacheSize [188]
                0.00    0.00       2/4964252     unixUnlock [155]
                0.00    0.00       2/4964252     unixLock [157]
                0.00    0.00       2/4964252     unixOpen [67]
                0.00    0.00       2/4964252     sqlite3Select <cycle 5> [77]
                0.00    0.00       2/4964252     sqlite3Parser <cycle 5> [74]
                0.00    0.00       3/4964252     unixClose [162]
                0.00    0.00       3/4964252     sqlite3PagerClose [59]
                0.00    0.00       3/4964252     releaseMemArray [179]
                0.00    0.00       4/4964252     sqlite3_vfs_register <cycle 4> [154]
                0.00    0.00       4/4964252     sqlite3BtreeClose [58]
                0.00    0.00       7/4964252     sqlite3ExprListDelete <cycle 3> [165]
                0.00    0.00       8/4964252     columnName [117]
                0.00    0.00       8/4964252     sqlite3DeleteTable <cycle 2> [132]
                0.00    0.00       8/4964252     sqlite3SchemaFree [140]
                0.00    0.00      11/4964252     sqlite3HashClear [160]
                0.00    0.00      12/4964252     sqlite3VdbeFinalize [134]
                0.00    0.00      12/4964252     sqlite3RunParser <cycle 5> [100]
                0.00    0.00      12/4964252     sqlite3Prepare <cycle 5> [103]
                0.00    0.00      12/4964252     sqlite3LockAndPrepare <cycle 5> [174]
                0.00    0.00      12/4964252     sqlite3_exec <cycle 5> [3]
                0.00    0.00      13/4964252     sqlite3_close [49]
                0.00    0.00      14/4964252     sqlite3VdbeDelete [144]
                0.00    0.00      23/4964252     sqlite3_initialize <cycle 4> [55]
                0.00    0.00      66/4964252     sqliteResetColumnNames [133]
                0.00    0.00   21468/4964252     pcache1TruncateUnsafe [51]
                0.00    0.00   21469/4964252     pcache1Alloc [42]
                0.00    0.00   21469/4964252     sqlite3PagerUnref [83]
                0.00    0.00   21485/4964252     pcache1Fetch [35]
                0.00    0.00   21657/4964252     sqlite3Malloc [43]
                0.00    0.00  809419/4964252     sqlite3_step [11]
                0.00    0.00 4047023/4964252     sqlite3_column_text [5]
[193]    0.0    0.00    0.00 4964252         sqlite3_mutex_leave [193]
-----------------------------------------------
                0.00    0.00  809408/4856431     sqlite3VdbeMemRelease [57]
                0.00    0.00 4047023/4856431     sqlite3VdbeExec [12]
[194]    0.0    0.00    0.00 4856431         sqlite3VdbeMemReleaseExternal [194]
-----------------------------------------------
                0.00    0.00      20/4047043     sqlite3ValueText [6]
                0.00    0.00 4047023/4047043     sqlite3VdbeExec [12]
[195]    0.0    0.00    0.00 4047043         sqlite3VdbeMemNulTerminate [195]
-----------------------------------------------
                0.00    0.00       8/4047031     columnName [117]
                0.00    0.00 4047023/4047031     sqlite3_column_text [5]
[196]    0.0    0.00    0.00 4047031         sqlite3_value_text [196]
-----------------------------------------------
                0.00    0.00 4047023/4047023     sqlite3VdbeExec [12]
[197]    0.0    0.00    0.00 4047023         sqlite3VdbeCursorMoveto [197]
-----------------------------------------------
                0.00    0.00       1/809865      sqlite3InitOne <cycle 5> [124]
                0.00    0.00       2/809865      sqlite3VdbeSetNumCols [127]
                0.00    0.00       4/809865      clearSelect <cycle 2> [180]
                0.00    0.00       4/809865      sqlite3Pragma <cycle 5> [101]
                0.00    0.00       5/809865      sqlite3Parser <cycle 5> [74]
                0.00    0.00       6/809865      sqlite3Select <cycle 5> [77]
                0.00    0.00       6/809865      selectExpander <cycle 5> [89]
                0.00    0.00       8/809865      sqlite3SrcListDelete <cycle 2> [170]
                0.00    0.00       8/809865      sqlite3SchemaFree [140]
                0.00    0.00      10/809865      sqlite3_close [49]
                0.00    0.00      12/809865      resolveP2Values [167]
                0.00    0.00      12/809865      sqlite3VdbeReset [145]
                0.00    0.00      12/809865      sqlite3VdbeFinalize [134]
                0.00    0.00      12/809865      sqlite3Prepare <cycle 5> [103]
                0.00    0.00      16/809865      sqlite3DeleteTable <cycle 2> [132]
                0.00    0.00      24/809865      sqlite3_exec <cycle 5> [3]
                0.00    0.00      26/809865      releaseMemArray [179]
                0.00    0.00      27/809865      sqlite3VdbeMemGrow [23]
                0.00    0.00      30/809865      sqlite3ExprListDelete <cycle 3> [165]
                0.00    0.00      48/809865      sqlite3RunParser <cycle 5> [100]
                0.00    0.00      60/809865      sqlite3VdbeDelete [144]
                0.00    0.00     124/809865      sqliteResetColumnNames [133]
                0.00    0.00  809408/809865      sqlite3VdbeMemRelease [57]
[198]    0.0    0.00    0.00  809865         sqlite3DbFree [198]
-----------------------------------------------
                0.00    0.00      12/809431      sqlite3VdbeHalt [159]
                0.00    0.00  809419/809431      sqlite3VdbeExec [12]
[199]    0.0    0.00    0.00  809431         sqlite3BtreeMutexArrayLeave [199]
-----------------------------------------------
                0.00    0.00      24/809431      sqlite3VdbeHalt [159]
                0.00    0.00  809407/809431      sqlite3VdbeExec [12]
[200]    0.0    0.00    0.00  809431         sqlite3VdbeCheckFk [200]
-----------------------------------------------
                0.00    0.00  809407/809407      sqlite3VdbeExec [12]
[201]    0.0    0.00    0.00  809407         btreeParseCell [201]
-----------------------------------------------
                0.00    0.00  809407/809407      sqlite3VdbeExec [12]
[202]    0.0    0.00    0.00  809407         btreeParseCellPtr [202]
                0.00    0.00  809407/809407      sqlite3GetVarint [203]
                0.00    0.00       1/5           sqlite3GetVarint32 [266]
-----------------------------------------------
                0.00    0.00  809407/809407      btreeParseCellPtr [202]
[203]    0.0    0.00    0.00  809407         sqlite3GetVarint [203]
-----------------------------------------------
                0.00    0.00  809407/809407      sqlite3VdbeExec [12]
[204]    0.0    0.00    0.00  809407         sqlite3VdbeCloseStatement [204]
-----------------------------------------------
                0.00    0.00       2/86254       sqlite3Realloc [142]
                0.00    0.00   21469/86254       pcache1Alloc [42]
                0.00    0.00   21469/86254       pcache1Free [56]
                0.00    0.00   21657/86254       mallocWithAlarm [53]
                0.00    0.00   21657/86254       sqlite3_free [52]
[205]    0.0    0.00    0.00   86254         sqlite3MallocSize [205]
-----------------------------------------------
                0.00    0.00       1/21658       sqlite3Realloc [142]
                0.00    0.00   21657/21658       mallocWithAlarm [53]
[206]    0.0    0.00    0.00   21658         sqlite3MemRoundup [206]
-----------------------------------------------
                0.00    0.00   21657/21657       sqlite3_free [52]
[207]    0.0    0.00    0.00   21657         sqlite3MemFree [207]
-----------------------------------------------
                0.00    0.00   21657/21657       mallocWithAlarm [53]
[208]    0.0    0.00    0.00   21657         sqlite3MemMalloc [208]
-----------------------------------------------
                0.00    0.00       1/21472       pagerPagecount [303]
                0.00    0.00       3/21472       sqlite3BtreeBeginTrans [116]
                0.00    0.00   21468/21472       sqlite3PagerAcquire [30]
[209]    0.0    0.00    0.00   21472         sqlite3PagerPagecount [209]
                0.00    0.00       2/2           unixFileSize [297]
                0.00    0.00       2/2           sqlite3OsFileSize [287]
-----------------------------------------------
                0.00    0.00       2/21470       pcache1Fetch [35]
                0.00    0.00   21468/21470       pcache1TruncateUnsafe [51]
[210]    0.0    0.00    0.00   21470         pcache1PinPage [210]
-----------------------------------------------
                0.00    0.00       2/21470       btreeEndTransaction [152]
                0.00    0.00       2/21470       sqlite3BtreeCloseCursor [171]
                0.00    0.00   21466/21470       sqlite3BtreeNext [69]
[211]    0.0    0.00    0.00   21470         releasePage [211]
-----------------------------------------------
                0.00    0.00       1/21470       sqlite3BtreeBeginTrans [116]
                0.00    0.00       1/21470       sqlite3BtreeFactory [65]
                0.00    0.00   21468/21470       sqlite3PagerAcquire [30]
[212]    0.0    0.00    0.00   21470         sqlite3OsRead [212]
-----------------------------------------------
                0.00    0.00   21470/21470       sqlite3PagerUnref [83]
[213]    0.0    0.00    0.00   21470         sqlite3PcacheRelease [213]
-----------------------------------------------
                0.00    0.00       1/21470       sqlite3BtreeBeginTrans [116]
                0.00    0.00       1/21470       sqlite3BtreeFactory [65]
                0.00    0.00   21468/21470       sqlite3PagerAcquire [30]
[214]    0.0    0.00    0.00   21470         unixRead [214]
-----------------------------------------------
                0.00    0.00   21468/21468       getAndInitPage [32]
[215]    0.0    0.00    0.00   21468         btreeInitPage [215]
-----------------------------------------------
                0.00    0.00   21468/21468       pcache1TruncateUnsafe [51]
[216]    0.0    0.00    0.00   21468         pcache1FreePage [216]
-----------------------------------------------
                0.00    0.00     710/710         sqlite3Parser <cycle 5> [74]
[217]    0.0    0.00    0.00     710         yy_find_shift_action [217]
-----------------------------------------------
                0.00    0.00     278/278         sqlite3Parser <cycle 5> [74]
[218]    0.0    0.00    0.00     278         yy_shift [218]
-----------------------------------------------
                0.00    0.00     262/262         sqlite3RunParser <cycle 5> [100]
[219]    0.0    0.00    0.00     262         sqlite3GetToken [219]
                0.00    0.00     110/110         keywordCode [220]
-----------------------------------------------
                0.00    0.00     110/110         sqlite3GetToken [219]
[220]    0.0    0.00    0.00     110         keywordCode [220]
-----------------------------------------------
                                   9             sqlite3ExprListDelete <cycle 3> [165]
                                  18             sqlite3ExprClear <cycle 3> [252]
                0.00    0.00       2/70          sqlite3SrcListDelete <cycle 2> [170]
                0.00    0.00       2/70          sqlite3SelectDelete <cycle 2> [189]
                0.00    0.00       6/70          clearSelect <cycle 2> [180]
                0.00    0.00       8/70          sqlite3DeleteTable <cycle 2> [132]
                0.00    0.00      16/70          lookupName [177]
                0.00    0.00      29/70          sqliteResetColumnNames [133]
[221]    0.0    0.00    0.00      90         sqlite3ExprDelete <cycle 3> [221]
                                   9             sqlite3ExprListDelete <cycle 3> [165]
                                   9             sqlite3ExprClear <cycle 3> [252]
-----------------------------------------------
                0.00    0.00      75/75          sqlite3NameFromToken [86]
[222]    0.0    0.00    0.00      75         sqlite3Dequote [222]
-----------------------------------------------
                0.00    0.00       4/61          sqlite3FindFunction [120]
                0.00    0.00      57/61          sqlite3_initialize <cycle 4> [55]
[223]    0.0    0.00    0.00      61         sqlite3FuncDefInsert [223]
-----------------------------------------------
                0.00    0.00       6/57          sqlite3VdbeChangeP4 [265]
                0.00    0.00      51/57          vdbeFreeOpArray [247]
[224]    0.0    0.00    0.00      57         freeP4 [224]
-----------------------------------------------
                0.00    0.00       1/49          sqlite3BtreeRollback [182]
                0.00    0.00       1/49          sqlite3BtreeClose [58]
                0.00    0.00       1/49          sqlite3BtreeCommit [181]
                0.00    0.00       1/49          sqlite3InitOne <cycle 5> [124]
                0.00    0.00       2/49          sqlite3BtreeCursor [282]
                0.00    0.00       2/49          sqlite3BtreeSchema [136]
                0.00    0.00       2/49          sqlite3BtreeCloseCursor [171]
                0.00    0.00       2/49          sqlite3Pragma <cycle 5> [101]
                0.00    0.00       3/49          sqlite3BtreeSetCacheSize [188]
                0.00    0.00       3/49          sqlite3BtreeBeginTrans [116]
                0.00    0.00       6/49          sqlite3BtreeGetMeta [263]
                0.00    0.00      12/49          sqlite3Prepare <cycle 5> [103]
                0.00    0.00      13/49          sqlite3BtreeCommitPhaseTwo [158]
[225]    0.0    0.00    0.00      49         sqlite3BtreeEnter [225]
-----------------------------------------------
                0.00    0.00       1/49          sqlite3BtreeRollback [182]
                0.00    0.00       1/49          sqlite3BtreeClose [58]
                0.00    0.00       1/49          sqlite3BtreeCommit [181]
                0.00    0.00       1/49          sqlite3VdbeExec [12]
                0.00    0.00       2/49          sqlite3BtreeCursor [282]
                0.00    0.00       2/49          sqlite3BtreeSchema [136]
                0.00    0.00       2/49          sqlite3BtreeCloseCursor [171]
                0.00    0.00       2/49          sqlite3Pragma <cycle 5> [101]
                0.00    0.00       3/49          sqlite3BtreeSetCacheSize [188]
                0.00    0.00       3/49          sqlite3BtreeBeginTrans [116]
                0.00    0.00       6/49          sqlite3InitOne <cycle 5> [124]
                0.00    0.00      12/49          sqlite3Prepare <cycle 5> [103]
                0.00    0.00      13/49          sqlite3BtreeCommitPhaseTwo [158]
[226]    0.0    0.00    0.00      49         sqlite3BtreeLeave [226]
-----------------------------------------------
                0.00    0.00      44/44          sqlite3VdbeMemSetStr [153]
[227]    0.0    0.00    0.00      44         sqlite3VdbeMemSetNull [227]
-----------------------------------------------
                0.00    0.00      12/42          sqlite3FindCollSeq [110]
                0.00    0.00      14/42          sqlite3FindTable [242]
                0.00    0.00      16/42          sqlite3FindIndex [258]
[228]    0.0    0.00    0.00      42         sqlite3HashFind [228]
-----------------------------------------------
                0.00    0.00      29/29          sqlite3Parser <cycle 5> [74]
[229]    0.0    0.00    0.00      29         sqlite3AffinityType [229]
-----------------------------------------------
                0.00    0.00       1/29          sqlite3_vfs_find [72]
                0.00    0.00       1/29          openDatabase [61]
                0.00    0.00       4/29          sqlite3_vfs_register <cycle 4> [154]
                0.00    0.00       7/29          unixEnterMutex [146]
                0.00    0.00       7/29          unixLeaveMutex [147]
                0.00    0.00       9/29          sqlite3_initialize <cycle 4> [55]
[230]    0.0    0.00    0.00      29         sqlite3MutexAlloc [230]
-----------------------------------------------
                                  16             sqlite3WalkExpr <cycle 1> [176]
                0.00    0.00      12/38          sqlite3WalkSelect <cycle 5> [178]
[231]    0.0    0.00    0.00      28         sqlite3WalkExprList <cycle 1> [231]
                                  16             sqlite3WalkExpr <cycle 1> [176]
-----------------------------------------------
                0.00    0.00      10/22          sqlite3GetVdbe [87]
                0.00    0.00      12/22          sqlite3Parser <cycle 5> [74]
[232]    0.0    0.00    0.00      22         sqlite3VdbeAddOp0 [232]
-----------------------------------------------
                0.00    0.00       2/20          sqlite3Select <cycle 5> [77]
                0.00    0.00       2/20          sqlite3Pragma <cycle 5> [101]
                0.00    0.00      16/20          sqlite3StartTable <cycle 5> [102]
[233]    0.0    0.00    0.00      20         sqlite3AuthCheck [233]
-----------------------------------------------
                0.00    0.00       3/17          pager_unlock [148]
                0.00    0.00      14/17          btreeEndTransaction [152]
[234]    0.0    0.00    0.00      17         sqlite3BitvecDestroy [234]
-----------------------------------------------
                0.00    0.00      16/16          sqlite3WalkExpr <cycle 1> [176]
[235]    0.0    0.00    0.00      16         exprWalkNoop [235]
-----------------------------------------------
                0.00    0.00      16/16          generateColumnNames [125]
[236]    0.0    0.00    0.00      16         sqlite3VdbeSetColName [236]
-----------------------------------------------
                0.00    0.00       2/15          sqlite3WhereEnd [98]
                0.00    0.00       2/15          sqlite3CodeVerifySchema [99]
                0.00    0.00       2/15          selectInnerLoop [91]
                0.00    0.00       2/15          sqlite3WhereBegin [80]
                0.00    0.00       2/15          sqlite3Pragma <cycle 5> [101]
                0.00    0.00       5/15          sqlite3Parser <cycle 5> [74]
[237]    0.0    0.00    0.00      15         sqlite3VdbeAddOp2 [237]
-----------------------------------------------
                0.00    0.00       2/14          sqlite3ResetInternalSchema [143]
                0.00    0.00      12/14          sqlite3LockAndPrepare <cycle 5> [174]
[238]    0.0    0.00    0.00      14         sqlite3BtreeEnterAll [238]
-----------------------------------------------
                0.00    0.00       2/14          sqlite3ResetInternalSchema [143]
                0.00    0.00      12/14          sqlite3LockAndPrepare <cycle 5> [174]
[239]    0.0    0.00    0.00      14         sqlite3BtreeLeaveAll [239]
-----------------------------------------------
                0.00    0.00       1/13          sqlite3_close [49]
                0.00    0.00      12/13          sqlite3VdbeHalt [159]
[240]    0.0    0.00    0.00      13         callFinaliser [240]
-----------------------------------------------
                0.00    0.00       1/13          sqlite3BtreeCommit [181]
                0.00    0.00      12/13          sqlite3VdbeHalt [159]
[241]    0.0    0.00    0.00      13         sqlite3BtreeCommitPhaseOne [241]
-----------------------------------------------
                0.00    0.00       1/13          sqlite3AnalysisLoad [307]
                0.00    0.00       2/13          sqlite3InitOne <cycle 5> [124]
                0.00    0.00       2/13          sqlite3LocateTable <cycle 5> [285]
                0.00    0.00       8/13          sqlite3StartTable <cycle 5> [102]
[242]    0.0    0.00    0.00      13         sqlite3FindTable [242]
                0.00    0.00      14/42          sqlite3HashFind [228]
-----------------------------------------------
                                   1             sqlite3_initialize <cycle 4> [55]
                0.00    0.00       1/15          pcache1Create [70]
                0.00    0.00       1/15          unixOpen [67]
                0.00    0.00       2/15          findLockInfo [68]
                0.00    0.00       8/15          pcache1Fetch [35]
[243]    0.0    0.00    0.00      13         sqlite3_malloc <cycle 4> [243]
                                  13             sqlite3_initialize <cycle 4> [55]
-----------------------------------------------
                0.00    0.00      12/12          sqlite3RunParser <cycle 5> [100]
[244]    0.0    0.00    0.00      12         sqlite3DeleteTrigger [244]
-----------------------------------------------
                                   2             sqlite3Pragma <cycle 5> [101]
                                   2             sqlite3LocateTable <cycle 5> [285]
                                   8             sqlite3StartTable <cycle 5> [102]
[245]    0.0    0.00    0.00      12         sqlite3ReadSchema <cycle 5> [245]
                                   3             sqlite3Init <cycle 5> [272]
-----------------------------------------------
                                  12             sqlite3_exec <cycle 5> [3]
[246]    0.0    0.00    0.00      12         sqlite3_prepare <cycle 5> [246]
                                  12             sqlite3LockAndPrepare <cycle 5> [174]
-----------------------------------------------
                0.00    0.00      12/12          sqlite3VdbeDelete [144]
[247]    0.0    0.00    0.00      12         vdbeFreeOpArray [247]
                0.00    0.00      51/57          freeP4 [224]
-----------------------------------------------
                0.00    0.00      12/12          sqlite3Parser <cycle 5> [74]
[248]    0.0    0.00    0.00      12         yy_destructor [248]
-----------------------------------------------
                0.00    0.00       2/10          sqlite3Pragma <cycle 5> [101]
                0.00    0.00       8/10          sqlite3StartTable <cycle 5> [102]
[249]    0.0    0.00    0.00      10         sqlite3TwoPartName [249]
-----------------------------------------------
                0.00    0.00       1/9           setupLookaside [137]
                0.00    0.00       1/9           sqlite3PagerClose [59]
                0.00    0.00       7/9           pcache1Fetch [35]
[250]    0.0    0.00    0.00       9         sqlite3BeginBenignMalloc [250]
-----------------------------------------------
                0.00    0.00       1/9           setupLookaside [137]
                0.00    0.00       1/9           sqlite3PagerClose [59]
                0.00    0.00       7/9           pcache1Fetch [35]
[251]    0.0    0.00    0.00       9         sqlite3EndBenignMalloc [251]
-----------------------------------------------
                                   9             sqlite3ExprDelete <cycle 3> [221]
[252]    0.0    0.00    0.00       9         sqlite3ExprClear <cycle 3> [252]
                                  18             sqlite3ExprDelete <cycle 3> [221]
-----------------------------------------------
                0.00    0.00       8/8           generateColumnNames [125]
[253]    0.0    0.00    0.00       8         columnType [253]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3WalkExpr <cycle 1> [176]
[254]    0.0    0.00    0.00       8         resolveExprStep [254]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3StartTable <cycle 5> [102]
[255]    0.0    0.00    0.00       8         sqlite3CheckObjectName [255]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3ExprCodeGetColumn [95]
[256]    0.0    0.00    0.00       8         sqlite3ColumnDefault [256]
                0.00    0.00       8/8           sqlite3ValueFromExpr [260]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3ExprCodeGetColumn [95]
[257]    0.0    0.00    0.00       8         sqlite3ExprCacheStore [257]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3StartTable <cycle 5> [102]
[258]    0.0    0.00    0.00       8         sqlite3FindIndex [258]
                0.00    0.00      16/42          sqlite3HashFind [228]
-----------------------------------------------
                                   2             sqlite3InitOne <cycle 5> [124]
                                   6             sqlite3_exec <cycle 5> [3]
[259]    0.0    0.00    0.00       8         sqlite3InitCallback <cycle 5> [259]
                                   8             sqlite3_exec <cycle 5> [3]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3ColumnDefault [256]
[260]    0.0    0.00    0.00       8         sqlite3ValueFromExpr [260]
-----------------------------------------------
                0.00    0.00       8/8           sqlite3_exec <cycle 5> [3]
[261]    0.0    0.00    0.00       8         sqlite3_column_name [261]
-----------------------------------------------
                0.00    0.00       7/7           sqlite3_initialize <cycle 4> [55]
[262]    0.0    0.00    0.00       7         pthreadMutexInit [262]
-----------------------------------------------
                0.00    0.00       1/6           sqlite3VdbeExec [12]
                0.00    0.00       5/6           sqlite3InitOne <cycle 5> [124]
[263]    0.0    0.00    0.00       6         sqlite3BtreeGetMeta [263]
                0.00    0.00       6/49          sqlite3BtreeEnter [225]
-----------------------------------------------
                0.00    0.00       2/6           sqlite3WhereEnd [98]
                0.00    0.00       2/6           computeLimitRegisters [276]
                0.00    0.00       2/6           selectInnerLoop [91]
[264]    0.0    0.00    0.00       6         sqlite3ExprCacheClear [264]
-----------------------------------------------
                0.00    0.00       2/6           sqlite3VdbeAddOp4 [105]
                0.00    0.00       4/6           sqlite3WhereBegin [80]
[265]    0.0    0.00    0.00       6         sqlite3VdbeChangeP4 [265]
                0.00    0.00       6/57          freeP4 [224]
-----------------------------------------------
                0.00    0.00       1/5           btreeParseCellPtr [202]
                0.00    0.00       4/5           sqlite3VdbeExec [12]
[266]    0.0    0.00    0.00       5         sqlite3GetVarint32 [266]
-----------------------------------------------
                0.00    0.00       4/4           bestBtreeIndex [273]
[267]    0.0    0.00    0.00       4         findTerm [267]
-----------------------------------------------
                0.00    0.00       1/4           pcache1Destroy [62]
                0.00    0.00       3/4           pcache1Cachesize [185]
[268]    0.0    0.00    0.00       4         pcache1EnforceMaxPage [268]
-----------------------------------------------
                0.00    0.00       3/3           sqlite3PExpr [122]
[269]    0.0    0.00    0.00       3         exprSetHeight [269]
-----------------------------------------------
                0.00    0.00       1/3           sqlite3PagerClose [59]
                0.00    0.00       2/3           btreeEndTransaction [152]
[270]    0.0    0.00    0.00       3         pagerUnlockAndRollback [270]
-----------------------------------------------
                0.00    0.00       3/3           sqlite3PExpr [122]
[271]    0.0    0.00    0.00       3         sqlite3ExprAttachSubtrees [271]
-----------------------------------------------
                                   3             sqlite3ReadSchema <cycle 5> [245]
[272]    0.0    0.00    0.00       3         sqlite3Init <cycle 5> [272]
                                   2             sqlite3InitOne <cycle 5> [124]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3WhereBegin [80]
[273]    0.0    0.00    0.00       2         bestBtreeIndex [273]
                0.00    0.00       4/4           findTerm [267]
                0.00    0.00       2/2           bestOrClauseIndex [274]
-----------------------------------------------
                0.00    0.00       2/2           bestBtreeIndex [273]
[274]    0.0    0.00    0.00       2         bestOrClauseIndex [274]
-----------------------------------------------
                0.00    0.00       2/2           selectInnerLoop [91]
[275]    0.0    0.00    0.00       2         codeOffset [275]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3Select <cycle 5> [77]
[276]    0.0    0.00    0.00       2         computeLimitRegisters [276]
                0.00    0.00       2/6           sqlite3ExprCacheClear [264]
-----------------------------------------------
                0.00    0.00       1/2           sqlite3_initialize <cycle 4> [55]
                0.00    0.00       1/2           sqlite3_close [49]
[277]    0.0    0.00    0.00       2         pthreadMutexFree [277]
-----------------------------------------------
                0.00    0.00       2/2           unixLock [157]
[278]    0.0    0.00    0.00       2         rangeLock [278]
-----------------------------------------------
                0.00    0.00       2/2           resolveSelectStep [187]
[279]    0.0    0.00    0.00       2         resolveOrderGroupBy [279]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3WalkSelect <cycle 5> [178]
[280]    0.0    0.00    0.00       2         selectAddSubqueryTypeInfo [280]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3BtreeFactory [65]
[281]    0.0    0.00    0.00       2         setSectorSize [281]
                0.00    0.00       2/2           unixSectorSize [298]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3VdbeExec [12]
[282]    0.0    0.00    0.00       2         sqlite3BtreeCursor [282]
                0.00    0.00       2/49          sqlite3BtreeEnter [225]
                0.00    0.00       2/49          sqlite3BtreeLeave [226]
                0.00    0.00       1/1           pagerPagecount [303]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3SrcListDelete <cycle 2> [170]
[283]    0.0    0.00    0.00       2         sqlite3IdListDelete [283]
-----------------------------------------------
                0.00    0.00       2/2           selectExpander <cycle 5> [89]
[284]    0.0    0.00    0.00       2         sqlite3IndexedByLookup [284]
-----------------------------------------------
                                   2             selectExpander <cycle 5> [89]
[285]    0.0    0.00    0.00       2         sqlite3LocateTable <cycle 5> [285]
                0.00    0.00       2/13          sqlite3FindTable [242]
                                   2             sqlite3ReadSchema <cycle 5> [245]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3BtreeBeginTrans [116]
[286]    0.0    0.00    0.00       2         sqlite3OsAccess [286]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3PagerPagecount [209]
[287]    0.0    0.00    0.00       2         sqlite3OsFileSize [287]
-----------------------------------------------
                0.00    0.00       2/2           pager_reset [63]
[288]    0.0    0.00    0.00       2         sqlite3PcacheTruncate [288]
-----------------------------------------------
                                   2             sqlite3Select <cycle 5> [77]
[289]    0.0    0.00    0.00       2         sqlite3SelectPrep <cycle 5> [289]
                                   6             sqlite3WalkSelect <cycle 5> [178]
-----------------------------------------------
                0.00    0.00       2/2           selectExpander <cycle 5> [89]
[290]    0.0    0.00    0.00       2         sqlite3SrcListAssignCursors [290]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3SrcListAppend [113]
[291]    0.0    0.00    0.00       2         sqlite3SrcListEnlarge [291]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3WhereEnd [98]
[292]    0.0    0.00    0.00       2         sqlite3VdbeAddOp1 [292]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3Parser <cycle 5> [74]
[293]    0.0    0.00    0.00       2         sqlite3VdbeUsesBtree [293]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3_initialize <cycle 4> [55]
[294]    0.0    0.00    0.00       2         sqlite3_config [294]
-----------------------------------------------
                0.00    0.00       2/2           openDatabase [61]
[295]    0.0    0.00    0.00       2         sqlite3_errcode [295]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3BtreeBeginTrans [116]
[296]    0.0    0.00    0.00       2         unixAccess [296]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3PagerPagecount [209]
[297]    0.0    0.00    0.00       2         unixFileSize [297]
-----------------------------------------------
                0.00    0.00       2/2           setSectorSize [281]
[298]    0.0    0.00    0.00       2         unixSectorSize [298]
-----------------------------------------------
                0.00    0.00       2/2           whereInfoFree [300]
[299]    0.0    0.00    0.00       2         whereClauseClear [299]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3Select <cycle 5> [77]
[300]    0.0    0.00    0.00       2         whereInfoFree [300]
                0.00    0.00       2/2           whereClauseClear [299]
-----------------------------------------------
                0.00    0.00       2/2           sqlite3WhereBegin [80]
[301]    0.0    0.00    0.00       2         whereSplit [301]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3Pragma <cycle 5> [101]
[302]    0.0    0.00    0.00       1         getSafetyLevel [302]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3BtreeCursor [282]
[303]    0.0    0.00    0.00       1         pagerPagecount [303]
                0.00    0.00       1/21472       sqlite3PagerPagecount [209]
-----------------------------------------------
                0.00    0.00       1/1           unixOpen [67]
[304]    0.0    0.00    0.00       1         posixIoFinderImpl [304]
-----------------------------------------------
                0.00    0.00       1/1           unixClose [162]
[305]    0.0    0.00    0.00       1         releaseLockInfo [305]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3BtreeRollback [182]
[306]    0.0    0.00    0.00       1         saveAllCursors [306]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3InitOne <cycle 5> [124]
[307]    0.0    0.00    0.00       1         sqlite3AnalysisLoad [307]
                0.00    0.00       1/13          sqlite3FindTable [242]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3_close [49]
[308]    0.0    0.00    0.00       1         sqlite3CloseSavepoints [308]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3Realloc [142]
[309]    0.0    0.00    0.00       1         sqlite3MallocAlarm [309]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3_initialize <cycle 4> [55]
[310]    0.0    0.00    0.00       1         sqlite3MemInit [310]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3Realloc [142]
[311]    0.0    0.00    0.00       1         sqlite3MemRealloc [311]
-----------------------------------------------
                0.00    0.00       1/1           sqlite3BtreeFactory [65]
[312]    0.0    0.00    0.00       1         sqlite3OsOpen [312]
-----------------------------------------------
                                   1             pcache1Init <cycle 4> [169]
[313]    0.0    0.00    0.00       1         sqlite3_mutex_alloc <cycle 4> [313]
                                   1             sqlite3_initialize <cycle 4> [55]
-----------------------------------------------
                0.00    0.00       1/1           vappr_init(std::string) [4]
[314]    0.0    0.00    0.00       1         sqlite3_open [314]
-----------------------------------------------
                                   1             sqlite3_initialize <cycle 4> [55]
[315]    0.0    0.00    0.00       1         sqlite3_os_init <cycle 4> [315]
                                   4             sqlite3_vfs_register <cycle 4> [154]
-----------------------------------------------
                0.00    0.00  809400/809400      AssociativeCache::access(long, int, bool) [19]
[885]    0.0    0.00    0.00  809400         RDTSC() [885]
-----------------------------------------------
                0.00    0.00   50883/50883       Part::memWrite(long, long, int) [28]
[886]    0.0    0.00    0.00   50883         Profiler::addToWrite(long, long, long, long) [886]
                0.00    0.00    1313/11638       std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_unique_(std::_Rb_tree_const_iterator<std::pair<long const, Entry*> >, std::pair<long const, Entry*> const&) [887]
-----------------------------------------------
                0.00    0.00       1/11638       __do_global_ctors_aux [950]
                0.00    0.00    1313/11638       Profiler::addToWrite(long, long, long, long) [886]
                0.00    0.00   10324/11638       Profiler::addToRead(long, long, long, long) [15]
[887]    0.0    0.00    0.00   11638         std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_unique_(std::_Rb_tree_const_iterator<std::pair<long const, Entry*> >, std::pair<long const, Entry*> const&) [887]
                0.00    0.00    8266/8268        std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_(std::_Rb_tree_node_base const*, std::_Rb_tree_node_base const*, std::pair<long const, Entry*> const&) [888]
                0.00    0.00       2/2           std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_unique(std::pair<long const, Entry*> const&) [895]
-----------------------------------------------
                0.00    0.00       2/8268        std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_unique(std::pair<long const, Entry*> const&) [895]
                0.00    0.00    8266/8268        std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_unique_(std::_Rb_tree_const_iterator<std::pair<long const, Entry*> >, std::pair<long const, Entry*> const&) [887]
[888]    0.0    0.00    0.00    8268         std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_(std::_Rb_tree_node_base const*, std::_Rb_tree_node_base const*, std::pair<long const, Entry*> const&) [888]
-----------------------------------------------
                0.00    0.00       2/6           Profiler::doReport(std::ostream&) [894]
                0.00    0.00       4/6           Part::doReport(std::ostream&) [903]
[889]    0.0    0.00    0.00       6         Profiler::getTotalStallCycles() [889]
-----------------------------------------------
                0.00    0.00       2/2           Part::Part(int, int, int, int, int, int, PrefetchMode) [904]
[890]    0.0    0.00    0.00       2         AssociativeCache::AssociativeCache(int, int, int, int, int, int) [890]
                0.00    0.00       2/2           Cache::Cache(int, int, int, int, int, int) [892]
-----------------------------------------------
                0.00    0.00       2/2           Part::doReport(std::ostream&) [903]
[891]    0.0    0.00    0.00       2         Cache::doReport(std::ostream&) [891]
-----------------------------------------------
                0.00    0.00       2/2           AssociativeCache::AssociativeCache(int, int, int, int, int, int) [890]
[892]    0.0    0.00    0.00       2         Cache::Cache(int, int, int, int, int, int) [892]
-----------------------------------------------
                0.00    0.00       2/2           Profiler::doReport(std::ostream&) [894]
[893]    0.0    0.00    0.00       2         Profiler::reportEntires(std::ostream&, std::list<Entry*, std::allocator<Entry*> >&, long, long, long, long) [893]
-----------------------------------------------
                0.00    0.00       2/2           Part::doReport(std::ostream&) [903]
[894]    0.0    0.00    0.00       2         Profiler::doReport(std::ostream&) [894]
                0.00    0.00       2/6           Profiler::getTotalStallCycles() [889]
                0.00    0.00       2/2           Profiler::reportEntires(std::ostream&, std::list<Entry*, std::allocator<Entry*> >&, long, long, long, long) [893]
-----------------------------------------------
                0.00    0.00       2/2           std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_unique_(std::_Rb_tree_const_iterator<std::pair<long const, Entry*> >, std::pair<long const, Entry*> const&) [887]
[895]    0.0    0.00    0.00       2         std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_unique(std::pair<long const, Entry*> const&) [895]
                0.00    0.00       2/8268        std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_(std::_Rb_tree_node_base const*, std::_Rb_tree_node_base const*, std::pair<long const, Entry*> const&) [888]
-----------------------------------------------
                0.00    0.00       1/1           __do_global_ctors_aux [950]
[896]    0.0    0.00    0.00       1         global constructors keyed to _ZN16AssociativeCacheC2Eiiiiii [896]
-----------------------------------------------
                0.00    0.00       1/1           __do_global_ctors_aux [950]
[897]    0.0    0.00    0.00       1         global constructors keyed to _ZN30FinitePrefetchAssociativeCacheC2Eiiiiii [897]
-----------------------------------------------
                0.00    0.00       1/1           __do_global_ctors_aux [950]
[898]    0.0    0.00    0.00       1         global constructors keyed to _ZN32InfinitePrefetchAssociativeCacheC2Eiiiiii [898]
-----------------------------------------------
                0.00    0.00       1/1           __do_global_ctors_aux [950]
[899]    0.0    0.00    0.00       1         global constructors keyed to _ZN4PartC2Eiiiiii12PrefetchMode [899]
-----------------------------------------------
                0.00    0.00       1/1           __do_global_ctors_aux [950]
[900]    0.0    0.00    0.00       1         global constructors keyed to _ZN5CacheC2Eiiiiii [900]
-----------------------------------------------
                0.00    0.00       1/1           __do_global_ctors_aux [950]
[901]    0.0    0.00    0.00       1         global constructors keyed to main [901]
-----------------------------------------------
                0.00    0.00       1/1           main [1]
[902]    0.0    0.00    0.00       1         vappr_add_executor(Executor*) [902]
-----------------------------------------------
                0.00    0.00       1/1           vappr_finalize() [50]
[903]    0.0    0.00    0.00       1         Part::doReport(std::ostream&) [903]
                0.00    0.00       4/6           Profiler::getTotalStallCycles() [889]
                0.00    0.00       2/2           Cache::doReport(std::ostream&) [891]
                0.00    0.00       2/2           Profiler::doReport(std::ostream&) [894]
-----------------------------------------------
                0.00    0.00       1/1           main [1]
[904]    0.0    0.00    0.00       1         Part::Part(int, int, int, int, int, int, PrefetchMode) [904]
                0.00    0.00       2/2           AssociativeCache::AssociativeCache(int, int, int, int, int, int) [890]
-----------------------------------------------

 This table describes the call tree of the program, and was sorted by
 the total amount of time spent in each function and its children.

 Each entry in this table consists of several lines.  The line with the
 index number at the left hand margin lists the current function.
 The lines above it list the functions that called this function,
 and the lines below it list the functions this one called.
 This line lists:
     index	A unique number given to each element of the table.
		Index numbers are sorted numerically.
		The index number is printed next to every function name so
		it is easier to look up where the function in the table.

     % time	This is the percentage of the `total' time that was spent
		in this function and its children.  Note that due to
		different viewpoints, functions excluded by options, etc,
		these numbers will NOT add up to 100%.

     self	This is the total amount of time spent in this function.

     children	This is the total amount of time propagated into this
		function by its children.

     called	This is the number of times the function was called.
		If the function called itself recursively, the number
		only includes non-recursive calls, and is followed by
		a `+' and the number of recursive calls.

     name	The name of the current function.  The index number is
		printed after it.  If the function is a member of a
		cycle, the cycle number is printed between the
		function's name and the index number.


 For the function's parents, the fields have the following meanings:

     self	This is the amount of time that was propagated directly
		from the function into this parent.

     children	This is the amount of time that was propagated from
		the function's children into this parent.

     called	This is the number of times this parent called the
		function `/' the total number of times the function
		was called.  Recursive calls to the function are not
		included in the number after the `/'.

     name	This is the name of the parent.  The parent's index
		number is printed after it.  If the parent is a
		member of a cycle, the cycle number is printed between
		the name and the index number.

 If the parents of the function cannot be determined, the word
 `<spontaneous>' is printed in the `name' field, and all the other
 fields are blank.

 For the function's children, the fields have the following meanings:

     self	This is the amount of time that was propagated directly
		from the child into the function.

     children	This is the amount of time that was propagated from the
		child's children to the function.

     called	This is the number of times the function called
		this child `/' the total number of times the child
		was called.  Recursive calls by the child are not
		listed in the number after the `/'.

     name	This is the name of the child.  The child's index
		number is printed after it.  If the child is a
		member of a cycle, the cycle number is printed
		between the name and the index number.

 If there are any cycles (circles) in the call graph, there is an
 entry for the cycle-as-a-whole.  This entry shows who called the
 cycle (as parents) and the members of the cycle (as children.)
 The `+' recursive calls entry shows the number of function calls that
 were internal to the cycle, and the calls entry for each member shows,
 for that member, how many times it was called from other members of
 the cycle.


Index by function name

 [896] global constructors keyed to _ZN16AssociativeCacheC2Eiiiiii [229] sqlite3AffinityType (sqlite3.c) [186] sqlite3ResolveExprNames (sqlite3.c)
 [897] global constructors keyed to _ZN30FinitePrefetchAssociativeCacheC2Eiiiiii [307] sqlite3AnalysisLoad (sqlite3.c) [100] sqlite3RunParser (sqlite3.c)
 [898] global constructors keyed to _ZN32InfinitePrefetchAssociativeCacheC2Eiiiiii [21] sqlite3ApiExit (sqlite3.c) [140] sqlite3SchemaFree (sqlite3.c)
 [899] global constructors keyed to _ZN4PartC2Eiiiiii12PrefetchMode [233] sqlite3AuthCheck (sqlite3.c) [126] sqlite3SchemaGet (sqlite3.c)
 [900] global constructors keyed to _ZN5CacheC2Eiiiiii [250] sqlite3BeginBenignMalloc (sqlite3.c) [77] sqlite3Select (sqlite3.c)
 [901] global constructors keyed to main [234] sqlite3BitvecDestroy (sqlite3.c) [189] sqlite3SelectDelete (sqlite3.c)
  [41] advanceTSC(long)      [116] sqlite3BtreeBeginTrans (sqlite3.c) [128] sqlite3SelectNew (sqlite3.c)
   [4] vappr_init(std::string) [58] sqlite3BtreeClose (sqlite3.c) [289] sqlite3SelectPrep (sqlite3.c)
  [50] vappr_finalize()      [171] sqlite3BtreeCloseCursor (sqlite3.c) [113] sqlite3SrcListAppend (sqlite3.c)
 [902] vappr_add_executor(Executor*) [181] sqlite3BtreeCommit (sqlite3.c) [114] sqlite3SrcListAppendFromTerm (sqlite3.c)
  [10] vappr_run_memory_accesses() [241] sqlite3BtreeCommitPhaseOne (sqlite3.c) [290] sqlite3SrcListAssignCursors (sqlite3.c)
 [885] RDTSC()               [158] sqlite3BtreeCommitPhaseTwo (sqlite3.c) [170] sqlite3SrcListDelete (sqlite3.c)
  [13] callback(void*, int, char**, char**) [282] sqlite3BtreeCursor (sqlite3.c) [291] sqlite3SrcListEnlarge (sqlite3.c)
  [22] AssociativeCache::read(long, int) [225] sqlite3BtreeEnter (sqlite3.c) [130] sqlite3SrcListIndexedBy (sqlite3.c)
  [60] AssociativeCache::write(long, int) [238] sqlite3BtreeEnterAll (sqlite3.c) [102] sqlite3StartTable (sqlite3.c)
  [19] AssociativeCache::access(long, int, bool) [65] sqlite3BtreeFactory (sqlite3.c) [18] sqlite3StrAccumAppend (sqlite3.c)
  [40] AssociativeCache::getIndex(long) [119] sqlite3BtreeFirst (sqlite3.c) [36] sqlite3StrAccumFinish (sqlite3.c)
 [890] AssociativeCache::AssociativeCache(int, int, int, int, int, int) [263] sqlite3BtreeGetMeta (sqlite3.c) [93] sqlite3TableLock (sqlite3.c)
  [16] Part::instruction(long) [226] sqlite3BtreeLeave (sqlite3.c) [249] sqlite3TwoPartName (sqlite3.c)
  [14] Part::memRead(long, long, int) [239] sqlite3BtreeLeaveAll (sqlite3.c) [151] sqlite3VMPrintf (sqlite3.c)
  [79] Part::memRead(long, long, long, int) [199] sqlite3BtreeMutexArrayLeave (sqlite3.c) [9] sqlite3VXPrintf (sqlite3.c)
 [903] Part::doReport(std::ostream&) [69] sqlite3BtreeNext (sqlite3.c) [184] sqlite3ValueFree (sqlite3.c)
  [28] Part::memWrite(long, long, int) [182] sqlite3BtreeRollback (sqlite3.c) [260] sqlite3ValueFromExpr (sqlite3.c)
 [904] Part::Part(int, int, int, int, int, int, PrefetchMode) [136] sqlite3BtreeSchema (sqlite3.c) [141] sqlite3ValueNew (sqlite3.c)
  [39] Cache::getTag(long)   [188] sqlite3BtreeSetCacheSize (sqlite3.c) [6] sqlite3ValueText (sqlite3.c)
 [891] Cache::doReport(std::ostream&) [255] sqlite3CheckObjectName (sqlite3.c) [232] sqlite3VdbeAddOp0 (sqlite3.c)
 [892] Cache::Cache(int, int, int, int, int, int) [308] sqlite3CloseSavepoints (sqlite3.c) [292] sqlite3VdbeAddOp1 (sqlite3.c)
  [20] Profiler::addToUsage(long, long) [99] sqlite3CodeVerifySchema (sqlite3.c) [237] sqlite3VdbeAddOp2 (sqlite3.c)
 [886] Profiler::addToWrite(long, long, long, long) [256] sqlite3ColumnDefault (sqlite3.c) [75] sqlite3VdbeAddOp3 (sqlite3.c)
 [893] Profiler::reportEntires(std::ostream&, std::list<Entry*, std::allocator<Entry*> >&, long, long, long, long) [121] sqlite3CreateFunc (sqlite3.c) [105] sqlite3VdbeAddOp4 (sqlite3.c)
 [889] Profiler::getTotalStallCycles() [198] sqlite3DbFree (sqlite3.c) [26] sqlite3VdbeChangeEncoding (sqlite3.c)
 [894] Profiler::doReport(std::ostream&) [78] sqlite3DbMallocRaw (sqlite3.c) [265] sqlite3VdbeChangeP4 (sqlite3.c)
  [15] Profiler::addToRead(long, long, long, long) [27] sqlite3DbMallocSize (sqlite3.c) [200] sqlite3VdbeCheckFk (sqlite3.c)
 [888] std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_(std::_Rb_tree_node_base const*, std::_Rb_tree_node_base const*, std::pair<long const, Entry*> const&) [90] sqlite3DbMallocZero (sqlite3.c) [204] sqlite3VdbeCloseStatement (sqlite3.c)
 [895] std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_unique(std::pair<long const, Entry*> const&) [71] sqlite3DbRealloc (sqlite3.c) [106] sqlite3VdbeCreate (sqlite3.c)
 [887] std::_Rb_tree<long, std::pair<long const, Entry*>, std::_Select1st<std::pair<long const, Entry*> >, std::less<long>, std::allocator<std::pair<long const, Entry*> > >::_M_insert_unique_(std::_Rb_tree_const_iterator<std::pair<long const, Entry*> >, std::pair<long const, Entry*> const&) [82] sqlite3DbReallocOrFree (sqlite3.c) [197] sqlite3VdbeCursorMoveto (sqlite3.c)
 [173] allocateCursor (sqlite3.c) [85] sqlite3DbStrNDup (sqlite3.c) [144] sqlite3VdbeDelete (sqlite3.c)
 [273] bestBtreeIndex (sqlite3.c) [132] sqlite3DeleteTable (sqlite3.c) [12] sqlite3VdbeExec (sqlite3.c)
 [274] bestOrClauseIndex (sqlite3.c) [244] sqlite3DeleteTrigger (sqlite3.c) [134] sqlite3VdbeFinalize (sqlite3.c)
 [152] btreeEndTransaction (sqlite3.c) [222] sqlite3Dequote (sqlite3.c) [172] sqlite3VdbeFreeCursor (sqlite3.c)
  [29] btreeGetPage (sqlite3.c) [251] sqlite3EndBenignMalloc (sqlite3.c) [159] sqlite3VdbeHalt (sqlite3.c)
 [215] btreeInitPage (sqlite3.c) [107] sqlite3EndTable (sqlite3.c) [92] sqlite3VdbeMakeLabel (sqlite3.c)
 [201] btreeParseCell (sqlite3.c) [139] sqlite3Error (sqlite3.c) [168] sqlite3VdbeMakeReady (sqlite3.c)
 [202] btreeParseCellPtr (sqlite3.c) [112] sqlite3Expr (sqlite3.c) [23] sqlite3VdbeMemGrow (sqlite3.c)
 [240] callFinaliser (sqlite3.c) [109] sqlite3ExprAlloc (sqlite3.c) [163] sqlite3VdbeMemMakeWriteable (sqlite3.c)
 [180] clearSelect (sqlite3.c) [271] sqlite3ExprAttachSubtrees (sqlite3.c) [195] sqlite3VdbeMemNulTerminate (sqlite3.c)
 [183] closeUnixFile (sqlite3.c) [264] sqlite3ExprCacheClear (sqlite3.c) [57] sqlite3VdbeMemRelease (sqlite3.c)
 [275] codeOffset (sqlite3.c) [257] sqlite3ExprCacheStore (sqlite3.c) [194] sqlite3VdbeMemReleaseExternal (sqlite3.c)
  [17] columnMallocFailure (sqlite3.c) [252] sqlite3ExprClear (sqlite3.c) [227] sqlite3VdbeMemSetNull (sqlite3.c)
  [25] columnMem (sqlite3.c)  [94] sqlite3ExprCode (sqlite3.c) [153] sqlite3VdbeMemSetStr (sqlite3.c)
 [117] columnName (sqlite3.c) [97] sqlite3ExprCodeExprList (sqlite3.c) [45] sqlite3VdbeMemStoreType (sqlite3.c)
 [253] columnType (sqlite3.c) [95] sqlite3ExprCodeGetColumn (sqlite3.c) [7] sqlite3VdbeMemStringify (sqlite3.c)
 [276] computeLimitRegisters (sqlite3.c) [96] sqlite3ExprCodeTarget (sqlite3.c) [145] sqlite3VdbeReset (sqlite3.c)
 [111] createCollation (sqlite3.c) [221] sqlite3ExprDelete (sqlite3.c) [24] sqlite3VdbeSerialGet (sqlite3.c)
  [47] dup8bytes (sqlite3.c)  [81] sqlite3ExprListAppend (sqlite3.c) [236] sqlite3VdbeSetColName (sqlite3.c)
 [269] exprSetHeight (sqlite3.c) [165] sqlite3ExprListDelete (sqlite3.c) [127] sqlite3VdbeSetNumCols (sqlite3.c)
 [235] exprWalkNoop (sqlite3.c) [115] sqlite3ExprListSetName (sqlite3.c) [293] sqlite3VdbeUsesBtree (sqlite3.c)
  [68] findLockInfo (sqlite3.c) [110] sqlite3FindCollSeq (sqlite3.c) [176] sqlite3WalkExpr (sqlite3.c)
 [267] findTerm (sqlite3.c)  [120] sqlite3FindFunction (sqlite3.c) [231] sqlite3WalkExprList (sqlite3.c)
 [224] freeP4 (sqlite3.c)    [258] sqlite3FindIndex (sqlite3.c) [178] sqlite3WalkSelect (sqlite3.c)
 [125] generateColumnNames (sqlite3.c) [242] sqlite3FindTable (sqlite3.c) [80] sqlite3WhereBegin (sqlite3.c)
  [32] getAndInitPage (sqlite3.c) [223] sqlite3FuncDefInsert (sqlite3.c) [98] sqlite3WhereEnd (sqlite3.c)
 [302] getSafetyLevel (sqlite3.c) [219] sqlite3GetToken (sqlite3.c) [49] sqlite3_close
  [76] growOpArray (sqlite3.c) [203] sqlite3GetVarint (sqlite3.c) [261] sqlite3_column_name
 [220] keywordCode (sqlite3.c) [266] sqlite3GetVarint32 (sqlite3.c) [5] sqlite3_column_text
 [177] lookupName (sqlite3.c) [87] sqlite3GetVdbe (sqlite3.c) [294] sqlite3_config
  [53] mallocWithAlarm (sqlite3.c) [160] sqlite3HashClear (sqlite3.c) [295] sqlite3_errcode
  [33] moveToChild (sqlite3.c) [228] sqlite3HashFind (sqlite3.c) [3] sqlite3_exec
  [34] moveToLeftmost (sqlite3.c) [104] sqlite3HashInsert (sqlite3.c) [52] sqlite3_free
 [118] moveToRoot (sqlite3.c) [283] sqlite3IdListDelete (sqlite3.c) [55] sqlite3_initialize
  [61] openDatabase (sqlite3.c) [284] sqlite3IndexedByLookup (sqlite3.c) [243] sqlite3_malloc
 [303] pagerPagecount (sqlite3.c) [272] sqlite3Init (sqlite3.c) [313] sqlite3_mutex_alloc
 [270] pagerUnlockAndRollback (sqlite3.c) [259] sqlite3InitCallback (sqlite3.c) [44] sqlite3_mutex_enter
  [63] pager_reset (sqlite3.c) [124] sqlite3InitOne (sqlite3.c) [46] sqlite3_mutex_free
 [148] pager_unlock (sqlite3.c) [285] sqlite3LocateTable (sqlite3.c) [193] sqlite3_mutex_leave
 [156] pager_wait_on_lock (sqlite3.c) [174] sqlite3LockAndPrepare (sqlite3.c) [314] sqlite3_open
  [42] pcache1Alloc (sqlite3.c) [150] sqlite3MPrintf (sqlite3.c) [315] sqlite3_os_init
 [185] pcache1Cachesize (sqlite3.c) [43] sqlite3Malloc (sqlite3.c) [138] sqlite3_overload_function
  [70] pcache1Create (sqlite3.c) [309] sqlite3MallocAlarm (sqlite3.c) [246] sqlite3_prepare
  [62] pcache1Destroy (sqlite3.c) [205] sqlite3MallocSize (sqlite3.c) [73] sqlite3_realloc
 [268] pcache1EnforceMaxPage (sqlite3.c) [108] sqlite3MallocZero (sqlite3.c) [8] sqlite3_snprintf
  [35] pcache1Fetch (sqlite3.c) [207] sqlite3MemFree (sqlite3.c) [11] sqlite3_step
  [56] pcache1Free (sqlite3.c) [310] sqlite3MemInit (sqlite3.c) [48] sqlite3_stmt_status
 [216] pcache1FreePage (sqlite3.c) [208] sqlite3MemMalloc (sqlite3.c) [196] sqlite3_value_text
 [169] pcache1Init (sqlite3.c) [311] sqlite3MemRealloc (sqlite3.c) [72] sqlite3_vfs_find
 [190] pcache1Pagecount (sqlite3.c) [206] sqlite3MemRoundup (sqlite3.c) [154] sqlite3_vfs_register
 [210] pcache1PinPage (sqlite3.c) [37] sqlite3MemSize (sqlite3.c) [133] sqliteResetColumnNames (sqlite3.c)
  [64] pcache1Truncate (sqlite3.c) [230] sqlite3MutexAlloc (sqlite3.c) [296] unixAccess (sqlite3.c)
  [51] pcache1TruncateUnsafe (sqlite3.c) [86] sqlite3NameFromToken (sqlite3.c) [162] unixClose (sqlite3.c)
  [84] pcache1Unpin (sqlite3.c) [88] sqlite3OpenTable (sqlite3.c) [146] unixEnterMutex (sqlite3.c)
 [304] posixIoFinderImpl (sqlite3.c) [286] sqlite3OsAccess (sqlite3.c) [297] unixFileSize (sqlite3.c)
 [123] pthreadMutexAlloc (sqlite3.c) [161] sqlite3OsClose (sqlite3.c) [149] unixFullPathname (sqlite3.c)
 [191] pthreadMutexEnter (sqlite3.c) [287] sqlite3OsFileSize (sqlite3.c) [147] unixLeaveMutex (sqlite3.c)
 [277] pthreadMutexFree (sqlite3.c) [312] sqlite3OsOpen (sqlite3.c) [157] unixLock (sqlite3.c)
 [262] pthreadMutexInit (sqlite3.c) [212] sqlite3OsRead (sqlite3.c) [67] unixOpen (sqlite3.c)
 [192] pthreadMutexLeave (sqlite3.c) [122] sqlite3PExpr (sqlite3.c) [214] unixRead (sqlite3.c)
  [38] pthreadMutexTry (sqlite3.c) [135] sqlite3PageFree (sqlite3.c) [298] unixSectorSize (sqlite3.c)
 [278] rangeLock (sqlite3.c) [131] sqlite3PageMalloc (sqlite3.c) [155] unixUnlock (sqlite3.c)
 [166] releaseAllSavepoints (sqlite3.c) [30] sqlite3PagerAcquire (sqlite3.c) [247] vdbeFreeOpArray (sqlite3.c)
 [305] releaseLockInfo (sqlite3.c) [59] sqlite3PagerClose (sqlite3.c) [299] whereClauseClear (sqlite3.c)
 [179] releaseMemArray (sqlite3.c) [209] sqlite3PagerPagecount (sqlite3.c) [300] whereInfoFree (sqlite3.c)
 [211] releasePage (sqlite3.c) [66] sqlite3PagerSetPagesize (sqlite3.c) [301] whereSplit (sqlite3.c)
 [254] resolveExprStep (sqlite3.c) [83] sqlite3PagerUnref (sqlite3.c) [248] yy_destructor (sqlite3.c)
 [279] resolveOrderGroupBy (sqlite3.c) [74] sqlite3Parser (sqlite3.c) [217] yy_find_shift_action (sqlite3.c)
 [167] resolveP2Values (sqlite3.c) [31] sqlite3PcacheFetch (sqlite3.c) [218] yy_shift (sqlite3.c)
 [187] resolveSelectStep (sqlite3.c) [213] sqlite3PcacheRelease (sqlite3.c) [175] <cycle 1>
 [306] saveAllCursors (sqlite3.c) [288] sqlite3PcacheTruncate (sqlite3.c) [129] <cycle 2>
 [280] selectAddSubqueryTypeInfo (sqlite3.c) [101] sqlite3Pragma (sqlite3.c) [164] <cycle 3>
  [89] selectExpander (sqlite3.c) [103] sqlite3Prepare (sqlite3.c) [54] <cycle 4>
  [91] selectInnerLoop (sqlite3.c) [245] sqlite3ReadSchema (sqlite3.c) [2] <cycle 5>
 [281] setSectorSize (sqlite3.c) [142] sqlite3Realloc (sqlite3.c)
 [137] setupLookaside (sqlite3.c) [143] sqlite3ResetInternalSchema (sqlite3.c)
