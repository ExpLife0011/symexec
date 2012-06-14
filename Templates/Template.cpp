#include "llvm/Pass.h"
#include "llvm/Function.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
  struct ${MY_OPT} : public FunctionPass {
    
    static char ID;
    ${MY_PASS}() : FunctionPass(ID) {}

    virtual bool runOnFunction(Function &F) {
      errs() << "# Pass ${MY_PASS}: ";
      errs().write_escaped(F.getName()) << '\n';
      return false;
    }

  };
}
  
char ${MY_PASS}::ID = 0;
static RegisterPass<${MY_PASS}> X("${MY_OPT}", "${MY_PASS} World Pass", false, false);
